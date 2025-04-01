# Host hardware modules
# modules for virtual machines for now

let
  hardwareDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
  dynamicAttrs = builtins.mapAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = import ././${dir};
    }) hardwareDirs
  );
in dynamicAttrs
