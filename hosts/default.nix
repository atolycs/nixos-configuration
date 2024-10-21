inputs:
let
  mkNixosSystem =
    { system
    , hostname
    , username
    , desktop
    , modules
    ,
    }:
    inputs.nixpkgs-stable.lib.nixosSystem {
      inherit system modules;
      specialArgs = {
        inherit inputs hostname username desktop;
        desktopManager = desktop or [ ];
      };
    };

  mkHomeManagerConfiguration =
    { system
    , username
    , modules
    ,
    }:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      extraSpecialArgs = {
        inherit inputs username;
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit system;
          config = {
            allowUnfree = true;
          };
        };
      };
      modules = modules ++ [
        {
          home = {
            inherit username;
            homeDirectory = "/home/${username}";
            stateVersion = "22.11";
          };
          programs = {
            home-manager.enable = true;
          };
        }
      ];
    };
in
{
  nixos = {
    vmware = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "vmware-nixos";
      username = "atolycs";
      desktop = "gdm";
      modules = [ ./vmware/nixos.nix ];
    };

    kvm = mkNixosSystem {
      system = "x86_64-linux";
      hostname = "kvm-nixos";
      username = "atolycs";
      desktop = "gdm";
      modules = [ ./kvm/nixos.nix ];
    };
  };

  home-manager = {
    "atolycs@vmware-nixos" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "atolycs";
      modules = [ ./vmware/home-manager.nix ];
    };
    "atolycs@kvm-nixos" = mkHomeManagerConfiguration {
      system = "x86_64-linux";
      username = "atolycs";
      modules = [ ./kvm/home-manager.nix ];
    };

  };
}
