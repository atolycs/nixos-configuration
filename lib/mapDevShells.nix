{ inputs, ... }@args:
with args.lib;
let
  inherit (args) flakeRoot;
  devShellDirs = builtins.filter (x: x != "default.nix") (
    builtins.attrNames (builtins.readDir "/${flakeRoot}/devshells")
  );
  dynamicLists = devShellDirs;
in
dynamicLists
