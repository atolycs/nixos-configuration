{ ... }@args:
with args;
let
  hostDirs = builtins.filter (x: x != "default.nix" && x != "test-template") (
    builtins.attrNames (builtins.readDir "/${flakeRoot}/hosts")
  );
  dynamicLists = hostDirs;
in
dynamicLists
