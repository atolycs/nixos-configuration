{
  description = "Atolycs's NixOS configuration";

  inputs = {
    nixpkgs = {
     url = "github:nixos/nixpkgs/nixos-24.11";
    };
    nixpkgs-unstable = {
     url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ...}@inputs : let
    atlibs = import ./lib;
  in
  {
    nixosModules = {
      config = import ./config/nixos;

    };
  }
}
