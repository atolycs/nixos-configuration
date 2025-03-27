let
  utilDirs = builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));

  dynamicAttrs = builtins.listToAttrs (
   map (dir: {
     name = builtins.replaceStrings [".nix"] [""] (builtins.baseNameOf dir);
     value = import ././${dir};
   }) utilDirs
  );
in
dynamicAttrs
