{ pkgs, ... }:
let
  global = import ./global.nix;
in
{
  config = {
   home.packages = global;
  };
}
