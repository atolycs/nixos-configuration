{ pkgs, outputs, ... }:
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
{

  imports = [
    outputs.nixosModules.fonts
    outputs.nixosModules.sound
    outputs.nixosModules.udisk2
  ];

  config = {
    services = {
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
