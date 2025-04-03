{
  description = "Atolycs NixOS configuration";

  inputs = {
    nixpkgs-unstable = {
      url = "github:nixos/nixpkgs?ref=nixos-unstable";
    };
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-24.11";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    let
      inherit (nixpkgs) lib;
      root = ./.;
    in
    {
      cLibs = import ./lib {
        inherit
          nixpkgs
          inputs
          root
          lib
          ;
      };
    };

}
