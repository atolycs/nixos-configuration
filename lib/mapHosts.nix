let
  hostsDirs = builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ../hosts));
  dynamicAttrs = builtins.listToAttrs(
   map (dir: {
     name = builtins.baseNameOf dir;
     value = import ././${dir}/nixos.nix;
   }) hostsDirs
  );
in

dynamicAttrs
