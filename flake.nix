{
  description = "Atolycs NixOS configuration";

  inputs = {
    nixpkgs-stable = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
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
        flakeRoot = ./.;
        cLibs = import ./lib { inherit withSystem; };
      in
      {
        imports = [
          inputs.treefmt-nix.flakeModule
          treefmt.default
        ];

        systems = import inputs.systems;
      }
    );
}
