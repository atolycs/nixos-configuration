{
  description = "Atolycs nixos configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
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
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      flake-utils,
      ...
    }@inputs:
    let
      stateVersion = "24.11";
      inherit (self) outputs;
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
      nameOfPathTest = path: replaceStrings [ "hosts" ] [ "" ] (dirOf (toString path));
    in

    flake-utils.lib.eachDefaultSystem (
      arch:
      let
        pkgs = nixpkgs.legacyPackages.${arch};
      in
      {
        devShells.default = import ./shell.nix {
          inherit pkgs;
        };
      }
    )
    // {
      nixosModules = import ./modules;
      nixosConfigurations =
        genAttrs (remove "mountPoint" (remove "hosts" (map nameOfPath ((listFilesRecursive ./hosts)))))
          (
            name:
            nix-helper.mkNixos {
              hostname = "nixos-${name}";
              hostProfile = "${name}";
            }
          );
    };

}
