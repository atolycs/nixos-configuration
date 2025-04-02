{
  description = "Atolycs's NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };
    devshells = {
      url = "github:numtide/devshell";
    };

    hd-systems = {
      url = "github:nix-systems/default";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      nixpkgs,
      ...
    }:
    let 
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.devshells.flakeModule
      ];
      systems = [ "x86_64-linux"];
      perSystem = { config, pkgs, ... }:
       {
         devShells = import ./devshells;
       };
    };
    # let
    #  atllib = import ./lib { inherit nixpkgs inputs; };
    # in{
    #   cLibs = atllib;
    #
    #   devShells = import ./devshells;
    # };
  # let
  #   inherit (builtins) ;
  #   inherit (nixpkgs) lib;
  #   atllib = import ./lib {
  #     inherit
  #       lib
  #       builtins
  #       nixpkgs
  #       self
  #       inputs
  #       ;
  #   };
  # in
  # {
  #   cLibs = atllib;
  #   nixosModules = import ./modules/nixos;
  #   hosts = atllib.mapHosts;
  #   devShells = atllib.mapDevShell;
  #
  #
  # };

}
