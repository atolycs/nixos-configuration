{self, ...}:
let
   bootDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
   dynamicAttrs = builtins.listToAttrs (
     map (dir: {
      name = builtins.replaceStrings [".nix"] [""] (builtins.baseNameOf dir);
      value = self.inputs.flake-parts.flake-parts-lib.importApply ././${dir};
    }) bootDirs
  );
in 
dynamicAttrs
# {
#   imports = (
#     builtins.map (module: ./. + "/${module}") (
#       builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.))
#     )
#   );
# }
