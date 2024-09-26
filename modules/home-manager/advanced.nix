{ system, nixpkgs, ... }:
let
  lib = nixpkgs.lib;
  pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
  };

  userPackages = import ./packages/userPackage.nix { inherit pkgs; };

in {
  home.stateVersion = "24.05";
  home.packages = userPackages;
}
