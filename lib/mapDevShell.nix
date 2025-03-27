{ ...,
  pkgs ?
   let
     lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
     nixpkgs = fetchTarball {
       url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
       sha256 = lock.narHash;
     };
   in
   import nixpkgs {
    config.allowUnfree = true;
    overlays = [ ];
   }
}@inputs:
let
in
{ }
