{ ... }@args:
with args;
let
  hostDirs = builtins.filter (x: x != "default.nix") (
    builtins.attrNames (builtins.readDir "/${flakeRoot}/hosts")
  );
  dynamicLists = hostDirs;
in
dynamicLists
