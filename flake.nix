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

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    systems.url = "github:nix-systems/default";

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
        hostRoot = "${flakeRoot}/hosts";
        homeRoot = "${flakeRoot}/home-manager";
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
          inputs.devshell.flakeModule
        ];

        systems = import inputs.systems;

        flake = {
          cLibs_test = cLibs;
          nixosConfigurations = lib.genAttrs (cLibs.mapHosts) (
            name:
            cLibs.mkHost {
              hostname = "nixos-${name}";
              hostProfile = "${name}";
            }
          );

          test_code = cLibs.mapHosts;
        };
        perSystem =
          { pkgs, system, ... }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
            };
            # treefmt = {
            #   projectRootFile = "${flakeRoot}/flake.nix";
            #   programs = {
            #     nixfmt.enable = true;
            #   };
            # };
            devShells = import ./devshells { inherit pkgs; };
          };

      }
    );
}
