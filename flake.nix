{
  description = "Atolycs nixos Configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixpkgs-stable = {
      url = "github:nixos/nixpkgs/nixos-24.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-stable";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      stateVersion = "24.05";
      nix-helper = import ./lib { inherit inputs outputs stateVersion; };
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = inputs.nixpkgs-stable.lib.genAttrs allSystems;
    in
    {

      nixosConfigurations = {
        vmware = nix-helper.mkNixOS {
          hostname = "vmware-nixos";
          desktop = "gdm";
        };
      };

      devShells = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs-stable.legacyPackages.${system};
          formatters = with pkgs; [
            nixfmt-rfc-style
            rustfmt
            stylua
            taplo
            neovim
            git
            gh
          ];

          scripts = [
            (pkgs.writeScriptBin "update-input" ''
              nix flake lock --override-input "$1" "$2"
            '')
          ];
        in
        {
          default = pkgs.mkShell { packages = ([ pkgs.nh ]) ++ formatters ++ scripts; };
        }
      );

      formatter = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs-stable.legacyPackages.${system}.nixfmt-rfc-style;
        in
        pkgs
      );
    };
}
