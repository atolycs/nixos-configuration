let
  presetDirs = builtins.filter (x: x != "default.nix" && x != "default") (builtins.attrNames (builtins.readDir ./.));

  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = import ././${dir};
    }) presetDirs
  );
in dynamicAttrs
