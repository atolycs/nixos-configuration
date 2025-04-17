{ ... }@args:
with args;
let
  homeDirs = builtins.filter (x: x != "default.nix") (
    builtins.attrNames (builtins.readDir "/${flakeRoot}/home-manager")
  );
  dynamicLists = homeDirs;
in
dynamicLists
