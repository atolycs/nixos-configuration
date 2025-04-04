{ inputs, ... }@args:
with args.lib;
let
  inherit (args) flakeRoot;
  hostDirs = builtins.filter (x: x != "default.nix") (
    builtins.attrNames (builtins.readDir "/${flakeRoot}/hosts")
  );
  dynamicLists = hostDirs;
in
dynamicLists
