{ lib, ... }:
with builtins lib;
let
  hostDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ../hosts));
  dynamicAttrs = builtins.listToAttrs (
    map (dir: {
      name = builtins.baseNameOf dir;
      value = "${dir}";
    }) hostDirs
  );
in
dynamicAttrs
