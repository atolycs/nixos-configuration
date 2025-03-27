{
  description = "Atolycs's NixOS configuration";

  inputs = {
    nixpkgs = {
     url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nixpkgs-unstable = {
     url = "github:nixos/nixpkgs/nixos-unstable";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
    };

    hd-systems = {
      url = "github:nix-systems/default";
    };


  };

  outputs = 
  	inputs@{
	  self,
	  nixpkgs,
	  flake-parts,
	  hd-systems,
	  ...
	}:
	let
	  inherit (builtins);
	  inherit (nixpkgs.lib);
          atllibs = import ./lib { inherit self inputs; };
	in

  {
         nixosConfigurations = atllibs.mapHosts;

  };

}
