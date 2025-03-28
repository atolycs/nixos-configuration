{
  inputs,
  nixpkgs,
  lib,
  config ? { },
  ...
}:
let
  libraryDirs = builtins.filter (x: x != "default.nix") (builtins.attrNames (builtins.readDir ./.));
  dynamicAttrs = builtins.mapAttrs ( name: value: import ././ + ${value}) {
    
  }
in libraryDirs
