let
  nixosModuleDirs = builtins.filter (x: x != "default.nix") (
    builtins.attrNames (builtins.readDir ./.)
  );
  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = import ././${dir};
    }) nixosModuleDirs
  );
in
dynamicAttrs
