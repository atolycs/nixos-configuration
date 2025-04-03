{
  inputs,
  nixpkgs,
  lib ? nixpkgs.lib,
  config ? { },
  ...
}@args:
with lib;

let
  libraryDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.replaceStrings [ ".nix" ] [ "" ] (builtins.baseNameOf dir);
      value = import ././${dir};
    }) libraryDirs
  );
in dynamicAttrs

# let
#   # == EXTENSIBLE FUNCTION ==
#   makeExtensible' =
#     rattrs:
#      let self = rattrs self // {
#         extend = f: lib.makeExtensible (lib.extends f rattrs);
#       };
#   in self;
#   # == END FUNCTION ==
#
#
#   lib = makeExtensible' (self :let
#     callLibs = file: import file { lib = self; };
#   in {
#       moduleDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
#       dynamicAttrs = builtins.listToAttrs (
#         map (dir: {
#             name = builtins.baseNameOf dir;
#             value = callLibs ././${dir};
#           }) moduleDirs
#       );
#     });
# in lib

# let
#
#   libraryDirs = builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
#   dynamicAttrs = builtins.listToAttrs (
#     map (dir: {
#         name = builtins.baseNameOf dir;
#         value = import ././${dir} { inherit inputs args; };
#       }) libraryDirs
#   );
#   # libraryDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
#   # dynamicAttrs = builtins.mapAttrs ( name: value: import ././ + ${value}) {
#   # libraryDirs = pipe ./. [
#   #   filesystem.listFilesRecursive (
#   #     builtins.filter(x: x != "default.nix" )
#   #   ) (
#   #     map (file: import file)
#   #   )
#   #   (foldr recursiveUpdate { })
#   # ];
# in  rec { } // dynamicAttrs
