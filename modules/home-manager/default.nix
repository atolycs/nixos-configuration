let
  hmModuleDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));

  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = import ././${dir};
    }) hmModuleDirs
  );
in

dynamicAttrs
