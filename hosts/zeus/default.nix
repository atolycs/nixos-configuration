{
  self,
  nixpkgs,
  ...
}:
let
  username = "atolycs";
  system = "x86_64-linux";
in {
  zeus = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit username; };
    
    modules = [
      ../../modules/common
      ./hardware-configuration.nix
    ]
  }
}
