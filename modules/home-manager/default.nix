# {
#   moduleWithSystem,
#   ...
# }:

# {
#   imports = (
#     builtins.map (module: ././${module}) (
#       builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
#     )
#   );
# }
{ ... }:
let
  modulesDir = builtins.filter (x: x != "default.nix" && x != "default") (
    builtins.attrNames (builtins.readDir ./.)
  );
  maybePath = path: if builtins.pathExists path then path else null;
  safeImport =
    filePath:
    if builtins.pathExists filePath && filePath != ./default.nix then
      import filePath 
    else
      throw "Invalid or recursive import detected: ${filePath}";

  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = builtins.trace "[nixos] Importing Module: ${dir}" (safeImport (././${dir}));
    }) modulesDir
  );
in dynamicAttrs
# dynamicAttrs = builtins.mapAttrs (name: module: {
#   name = builtins.baseNameOf module;
#   value = ././${module};
# }) modulesDir;
#   in {
#   # flake.nixosModules = moduleWithSystem(
#   #   preSystem@{ config }: {
#   #     inherit dynamicAttrs;
#   #   }
#   # );
#
#   flake.nixosModules = {
#     inherit dynamicAttrs;
#   }
# }
