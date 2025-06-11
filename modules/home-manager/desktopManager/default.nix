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
#{...}:
let
  modulesDir = builtins.filter (x: x != "default.nix" && x != "default") (
    builtins.attrNames (builtins.readDir ./.)
  );

  safeImport =
    filePath:
    if builtins.pathExists filePath && filePath != ./default.nix then
      import filePath
    else
      throw "Invalid or recursive import detected: ${filePath}";

  moduleList = map (dir: builtins.trace "[desktopManager] Importing Module...: ${dir}" (safeImport (././${dir}))) modulesDir;

  # dynamicAttrs = builtins.listToAttrs (
  #   map (dir: {
  #     name = builtins.baseNameOf dir;
  #     value = builtins.trace "[desktop-manager] Importing Module: ${dir}" (safeImport (././${dir}));
  #   }) modulesDir
  # );
in {
  imports = moduleList;
}
# dynamicAttrs = builtins.mapAttrs (name: module: {
#   name = builtins.baseNameOf module;
#   value = ././${module};
# }) modulesDir;
  #dynamicAttrs
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
