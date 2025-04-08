let
  presetsDir = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = import ././${dir};
    }) presetsDir
  );

in
dynamicAttrs
