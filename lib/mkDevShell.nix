{ pkgs ?
   let
     lock = (builtins.fromJSON (builtins.readFile ../flake.lock)).nodes.nixpkgs.locked;
     nixpkgs = fetchTarball {
        url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
        sha256 = lock.narHash;
      };
   in 
    import nixpkgs {
        config.allowUnfree = true;
        overlays = [ ];
    }
, devProfile ? "../devshells/develop.nix", ... }:
let 
   loadProfile = import ./. + "${devProfile}";
   nameOf = builtins.replaceStrings [".nix"][""] (builtins.baseNameOf devProfile);
in
pkgs.stdenv.mkDerivation (import ./. + "${devProfile}")
