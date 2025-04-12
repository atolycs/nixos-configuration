{
  description = "Atolycs nixos configuration";

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

    # systems = {
    #   url = "github:nix-systems/default";
    # };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      flake-utils,
      ...
    }:
    let
      flakeRoot = ./.;
      inherit (inputs.nixpkgs) lib;
      cLibs = import ./lib {
        inherit
          inputs
          lib
          flakeRoot
          self
          ;
      };
    in
    flake-utils.lib.eachDefaultSystem (
      arch:
      let
        pkgs = nixpkgs.legacyPackages.${arch};
      in
      {
        devShells = cLibs.pathTools.maybeLoad ./devShells { inherit pkgs; };
        nixosConfigurations = lib.genAttrs (cLibs.mapHosts) (
          name:
          cLibs.mkHost {
            hostname = "nixos-${name}";
            hostProfile = "${name}";
          }
        );
      }
    ) // {
      nixosModules = cLibs.pathTools.maybeLoad ./modules/nixos;
      test_code = import ./lib {
        inherit
          inputs
          lib
          self
          flakeRoot
          ;
      };
    };
}
