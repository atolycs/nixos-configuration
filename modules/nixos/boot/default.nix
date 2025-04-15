# {self, lib, flake-parts-lib, moduleLocation, ...}:
# let
#   inherit (lib)
#     mapAttrs
#     mkOption
#     types;
#
#   inherit (flake-parts-lib)
#     mkSubmoduleOptions;
#
# in {
#   options = {
#     flake = {
#       nixosModules = {
#         boot = mkOption {
#           type = types.lazyAttrsOf types.deferredModule;
#           default = { };
#           apply = mapAttrs(k: v: { _file = "${toString moduleLocation}#nixosModules.${k}"; imports = [v] );
#         };
#       };
#     };
#   };
#  };
# }

{
  imports = (
     builtins.map(module: ./. + "/${module}") (
      builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
    )
  );
}

# {moduleWithSystem, ...}:
#{ inputs, ... }:
# let
#   bootDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
#   safeImport = filePath:
#     if builtins.pathExists filePath && filePath != ./default.nix then
#           builtins.trace "Importing ${filePath} ... " import filePath
#     else
#        throw "Invalid or recursive import detected: ${filePath}";
#
#   dynamicAttrs = builtins.listToAttrs (
#     map (dir: {
#       name = builtins.replaceStrings[".nix"] [""] (builtins.baseNameOf dir);
#       value = "././${dir}";
#     }) bootDirs
#   );
#   #dynamicAttrs = bootDirs;
#
# in dynamicAttrs  
# {
#   imports = (
#     builtins.map (module: ././${module}) (
#       builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
#     )
#   );
# }
