{
  self,
  nixpkgs,
  home-manager,
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
      home-manager.nixosModules.home-manager {
          home-manager.useUserPackages = true;
          home-manager.users."${username}" = 
            import ../../modules/home-manager/advanced.nix {
                inherit system nixpkgs;
            };
      }
    ];
  };
}
