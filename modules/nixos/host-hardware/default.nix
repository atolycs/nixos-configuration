# Host hardware modules
# Modules for virtual machines for now

let
  hardwareDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));

  dynamicAttrs = builtins.listToAttrs (
    map ( dir : {
       name = builtins.baseNameOf dir;
       value = import ././${dir};
    }) hardwareDirs
  );
in

dynamicAttrs

