inputs:
let
  mkNixosSystem = {
   system,
   hostname,
   username,
   modules,
  }:
  inputs.nixpkgs.lib.nixosSystem {
    inherit system modules;
    specialArgs = {
      inherit inputs hostname username;
    };
  };
  
  mkHomeManagerConfiguration = {
    system,
    username,
    overlays,
    modules,
  }:
  inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system overlays;
        config = {
          allowUnfree = true;
        };
      };
      extraSpecialArgs = {
        inherit inputs username;
        pkgs-stable = import inputs.nixpkgs-stable
      };
  };
in {
  nixos = {
    vmware = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "vmware-nixos";
      username = "atolycs";
      modules = [ ./vmware ]
    }
  }
}
