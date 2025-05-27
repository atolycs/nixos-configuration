{
  description = "Atolycs NixOS configuration";

  nixConfig = {
    extra-substituers = [
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    nixpkgs-2411 = {
      url = "github:NixOS/nixpkgs/nixos-24.11";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
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
      #inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs =
    {
      flake-parts,
      self,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } (
      top@{
        moduleWithSystem,
        withSystem,
        flake-parts-lib,
        ...
      }:
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
        currentSystem = cLibs.getCurrentSystem;
      in
      {
        imports = [
          inputs.treefmt-nix.flakeModule
          inputs.devshell.flakeModule
          inputs.home-manager.flakeModules.home-manager
          #./modules/nixos
        ];
        # https://github.com/nyukuru/nixos-config/blob/99fd91244516af96822b72af4ab9150000784c2c/parts/modules.nix#L14-L15
        disabledModules = [
          "${inputs.flake-parts.outPath}/modules/nixosModules.nix"
        ];
        systems = import inputs.systems;
        
        perSystem =
          { pkgs, system, ... }:
          {
            _module.args.pkgs = import inputs.nixpkgs {
              inherit system;
            };

            legacyPackages = inputs.nixpkgs.legacyPackages.${system};
            treefmt = {
              projectRootFile = "./flake.nix";
              programs = {
                nixfmt = {
                  enable = true;
                };
              };
            };
            devShells = import ./devshells { inherit pkgs; };
        };

        flake = {
          cLibs_test = cLibs;
          nixosConfigurations = lib.genAttrs (cLibs.mapHosts) (
              name:
              cLibs.mkHost {
                hostname = "nixos-${name}";
                hostProfile = "${name}";
              }
          );
          homeConfigurations = lib.genAttrs (cLibs.mapHomes) (
            name: 
            cLibs.mkHome {
              system = currentSystem;
              homeProfile = "${name}";
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
          homeModules.default = import ./modules/home-manager;
        };

      }
    );
}
