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
      self,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (
      top@{ moduleWithSystem, withSystem, flake-parts-lib, ... }:
      let
        inherit (inputs.nixpkgs) lib;
        inherit (flake-parts-lib) importApply;
        flakeRoot = ./.;
        hostRoot = "${flakeRoot}/hosts";
        homeRoot = "${flakeRoot}/home-manager";
        cLibs = import ./lib {
          inherit
            withSystem
            inputs
            lib
            self
            flakeRoot
            ;
        };
      in
      {
        imports = [
          inputs.treefmt-nix.flakeModule
          inputs.devshell.flakeModule
          #./modules/nixos
        ];

        systems = import inputs.systems;

        flake = {
          nixosConfigurations = lib.genAttrs (cLibs.mapHosts) (
            name:
            cLibs.mkHost {
              hostname = "nixos-${name}";
              hostProfile = "${name}";
            }
          );
          # nixosModules = importApply ./modules/nixos { localFlake = self; inherit withSystem; };
          #nixosTest = import ./modules/nixos;
          #nixosModules = nixosModules';
          # nixosModules = moduleWithSystem(
          #    perSystem@{config}:
          #    { ... }: import ./modules/nixos
          # );
          # nixosModules = import ./modules/nixos;
          #nixosModules = importApply ./modules/nixos;
          nixosModules = import ./modules/nixos; 
          hardwareModules = import ./modules/host-hardware;
          nixosPresets = import ./presets;
        };
        perSystem =
          { pkgs, system, ... }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
            };
            treefmt = {
              projectRootFile = "${flakeRoot}/flake.nix";
              programs = {
                nixfmt = {
                  enable = true;
includes = [ "*.nix" ];
                  excludes = [ "*" ];
                };
              };
            };
            devShells = import ./devshells { inherit pkgs; };
          };

      }
    );
}
