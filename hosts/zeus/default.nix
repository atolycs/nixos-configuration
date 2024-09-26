{
  self,
  nixpkgs,
  ...
}:
let
  username = "atolycs";
  system = "x86_64-linux";
  hostname = "nixos-zeus";
in {
  zeus = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit username hostname; };
    
    modules = [
      ../../modules/common
      ./hardware-configuration.nix
    ];
  };
}
