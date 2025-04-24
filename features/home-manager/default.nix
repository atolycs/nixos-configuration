# Home Manager feature toggle module
# 2025, Atolycs

{
  imports = (
    builtins.map (module: ./. + "/${module}") (
      builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
    )
  );
}

# let
#   configDir = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
#   safeImport = filePath:
#     if builtins.pathExists filePath && filePath != ./default.nix then
#       import filePath
#     else
#       { };
#   dynamicAttrs = builtins.listToAttrs (
#   map (dir: {
#       name = builtins.baseNameOf dir;
#       value = import ./. + "/${dir}";
#     }) configDir
#   );
# in
#   dynamicAttrs
# rec {
#   config.atlConfig = dynamicAttrs;
#   # imports = (
#   #   builtins.map (module: ./. + "${module}") (
#   #     builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
#   #   )
#   # );
# }
