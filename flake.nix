{
  description = "Atolycs NixOS configurations";

  inputs = {
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
      ];
      forAllSystems = inputs.nixpkgs-stable.lib.genAttrs allSystems;
    in
  {
    #packages = forAllSystems (system: import ./pkgs inputs.nixpkgs-stable.legacyPackages.${system});
    nixosConfigurations = (import ./hosts inputs).nixos;
    homeConfigurations = (import ./hosts inputs).hoem-manager; 
    
    devShells = forAllSystems(
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

        in {
          default = pkgs.mkShell { 
            packages = ([
              pkgs.nh
            ]) ++ formatters ++ scripts;
          }
        };
    );
  };
}
