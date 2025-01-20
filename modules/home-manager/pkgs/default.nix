{ pkgs, ... }:
let
  global = import ./global.nix { inherit pkgs; };
in
{
  config = {
   home.packages = global;
  };
}
