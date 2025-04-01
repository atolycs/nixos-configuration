# Host hardware modules
# modules for virtual machines for now

let
  hardwareDirs = builtins.filter(x: x != "default.nix") (builtins.attrNames (builtins.readDir ./. ));
in
builtins.listToAttrs(
  map (dir: {
       name = builtins.baseNameOf dir;
       value = import ././${dir};
  }) hardwareDirs
)
