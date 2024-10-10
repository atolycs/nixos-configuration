{
  description = "Atolycs NixOS configurations";

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

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
  };

  outputs =
    inputs:
    let
      allSystems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = inputs.nixpkgs-stable.lib.genAttrs allSystems;
    in
    {
      #packages = forAllSystems (system: import ./pkgs inputs.nixpkgs-stable.legacyPackages.${system});
      nixosConfigurations = (import ./hosts inputs).nixos;
      homeConfigurations = (import ./hosts inputs).home-manager;

      devShells = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs-stable.legacyPackages.${system};
          formatters = with pkgs; [
            nixfmt-rfc-style
            rustfmt
            stylua
            taplo
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

      # formatter.x86_64-linux = inputs.nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
      # formatter = forAllSystems (
      #   system:
      #   let
      #     pkgs = inputs.nixpkgs.legacyPackages.${system};
      #     formatters = with pkgs; [
      #       nixfmt-rfc-style
      #       rustfmt
      #       stylua
      #       taplo
      #     ];
      #
      #     format = pkgs.writeScriptBin "format" ''
      #       PATH=$PATH:${pkgs.lib.makeBinPath formatters}
      #       ${pkgs.treefmt}/bin/treefmt --config-file ${./treefmt.toml}
      #     '';
      #   in
      #   format
      # );
    };
}
