{
  description = "Atolycs nixos configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-wsl,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    let
      stateVersion = "24.11";
      inherit (nixpkgs.lib.lists) drop remove;
      inherit (nixpkgs.lib.path) splitRoot;
      inherit (nixpkgs.lib.filesystem) listFilesRecursive;
      inherit (nixpkgs.lib) replaceStrings genAttrs;
      nix-helper = import ./lib {
        inherit
          inputs
          outputs
          self
          stateVersion
          home-manager
          ;
      };

      # system list
      nameOfNix = path: replaceStrings [ ".nix" ] [ "" ] (baseNameOf (toString path));
      nameOfPath = path: baseNameOf (dirOf (toString path));
      #nameOfHM = path: baseNameOf (dirOf (toString path));
      #nameOfPathTest = path: replaceStrings [ "hosts" ] [ "" ] (dirOf (toString path));
      outputs = self;
    in

    flake-utils.lib.eachDefaultSystem (
      arch:
      let
        pkgs = nixpkgs.legacyPackages.${arch};
      in
      {
        devShells = {
	  develop = import ./shell.nix {
		  inherit pkgs;
		};
	};
      }
    )
    // {
      nixosModules = import ./modules/nixos;
      nixosProfiles = import ./base-profiles;
      homeModules = import ./modules/home-manager;

      nixosConfigurations =
        genAttrs (remove "mountPoint" (remove "hosts" (map nameOfPath ((listFilesRecursive ./hosts)))))
          (
            name:
            nix-helper.mkNixos {
              hostname = "nixos-${name}";
              hostProfile = "${name}";
            }
          );
      homeConfigurations =
        genAttrs
          (remove "home-manager" (remove "nixos" (map nameOfPath ((listFilesRecursive ./home-manager)))))
          (
            name:
            nix-helper.mkHomeManager {
              homeProfile = "${name}";
            }
          );
    };

}
