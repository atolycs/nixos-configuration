{
  description = "Atolycs nixos configuration";

  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs =
    { self, nixpkgs, nixpkgs-unstable, home-manager, flake-utils, ... }@inputs:
    let
      stateVersion = "24.11";
      inherit (self) outputs;
      inherit (nixpkgs.lib.lists) remove;
      inherit (nixpkgs.lib) replacestrings genAttrs;
      inherit (nixpkgs.lib.path) removePrefix splitRoot;
      inherit (nixpkgs.lib.filessytem) listFilesRecursive;

      # nix-helper = import ./lib {
      #    inherit outputs self stateVersion;
      #};
    in flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in { devShells.default = import ./shell.nix { inherit pkgs; }; });
}
