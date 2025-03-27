{ pkgs, ... }@inputs:
let
  scripts = [
    (pkgs.writeScriptBin "switch-nixos" ''
      sudo nixos-rebuild switch --flake ".#$@" --show-trace
    '')

    (pkgs.writeScriptBin "switch-home" ''
      home-manager switch --flake ".#$@" --show-trace
    '')
  ];
in

pkgs.stdenv.mkDerivation {
  name = "devNix";

}

