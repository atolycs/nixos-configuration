let
  hostsDirs = builtins.filter (x: x != "default.nix") (
    builtins.attrNames (builtins.readDir ../devshells)
  );
  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.replaceStrings [ ".nix" ] [ "" ] (builtins.baseNameOf dir);
      value = "../devshells/${dir}";
    }) hostsDirs
  );
in
dynamicAttrs
