{ nixpkgs, ... }:
let
  modulesDir = builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
  dynamicAttrs = builtins.listToAttrs (
     builtins.map(dir: {
        name = builtins.baseNameOf dir;
        value = import ./. + "/${dir}" {inherit nixpkgs; };
      }) modulesDir
  );
in dynamicAttrs
