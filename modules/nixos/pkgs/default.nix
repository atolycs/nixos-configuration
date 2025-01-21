{ pkgs, ... }:
let
  global = import ./global.nix { inherit pkgs; };
in
{
  environment.systemPackages = [ ] ++ global;
}
