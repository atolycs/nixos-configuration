{
  description = "Atolycs NixOS configuration";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    systems.url = "github:nix-systems/default";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (
      { withSystem, flake-parts-lib, ... }:
      let
        inherit (inputs.nixpkgs) lib;
        flakeRoot = ./.;
        cLibs = import ./lib {
          inherit
            withSystem
            inputs
            lib
            flakeRoot
            ;
        };
      in
      {
        imports = [
          inputs.treefmt-nix.flakeModule
        ];

        systems = import inputs.systems;

        flake = {
          test_code = cLibs.mapMachines;
          nixosConfigurations = lib.genAttrs (cLibs.mapHosts) (
            name:
            cLibs.mkHost {
              inherit inputs;
              hostname = "nixos-${name}";
              hostProfile = "${name}";
            }
          );

        };
      }
    );
}
