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
      systems = inputs.hd-systems;
      flake =
        let
          inherit (nixpkgs) lib;
          atllib = import ./lib {
            inherit
              inputs
              lib
              builtins
              nixpkgs
              self
              ;
          };
        in
        {
          nixosModules = import ./modules/nixos;
          nixosConfigurations = atllib.mapHosts;
        };
    };
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
