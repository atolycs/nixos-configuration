{ pkgs, outputs, lib, ... }:
let
  x86_64-graphics =
    if (!pkgs.stdenv.hostPlatform.isAarch64) then
      {
        enable32Bit = true;
      }
    else
      { };

  all-graphics = {
    enable = true;
  };
in
with lib.gvariant;

{

  imports = [
    outputs.nixosModules.fonts
    outputs.nixosModules.sound
    outputs.nixosModules.udisk2
  ];

  config = {
    services = {
      accounts-daemon.enable = true;
      udev.packages = with pkgs; [ gnome-settings-daemon ];
      gnome = {
        gnome-browser-connector.enable = true;
      };
      xserver = {
        excludePackages = [ pkgs.xterm ];
        enable = true;
        displayManager.gdm = {
          enable = true;
          wayland = true;
          autoSuspend = false;
        };
        desktopManager = {
          gnome = {
            enable = true;
            extraGSettingsOverridePackages = [
              pkgs.gsettings-desktop-schemas
              pkgs.gnome-shell
            ];
          };
          runXdgAutostartIfNone = true;
        };
      };
    };

    programs.dconf = {
      enable = true;
      profiles.gdm.databases = [{
        settings."org/gnome/settings-daemon/plugins/power" = {
         sleep-inactive-ac-timeout = mkUint32 0;
	 sleep-inactive-ac-type = "nothing";
	};
      }];
    };

    environment.gnome.excludePackages = (
      with pkgs;
      [
        gnome-tour
        epiphany
        hitori
        iagno
        gnome-music
        geary
        cheese
      ]
    );
    hardware.graphics = all-graphics // x86_64-graphics;
  };
}
