{ pkgs, outputs, ... }:
let
  x86_64-graphics = 
    if (!pkgs.stdenv.hostPlatform.isAarch64) then
    {
      enable32Bit = true;
    }
    else {};
  
  all-graphics = { enable = true; };

in
{
  config = {
    
    imports = [
      outputs.nixosModules.fonts
      outputs.nixosModules.sound
    ];
    
    services = {
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
          gnome.enable = true;
          runXdgAutostartIfNone = true;
          extraGSettingsOverridePackages = [
            pkgs.gsettings-desktop-schemas
            pkgs.gnome-shell
          ];
        };
      };
    };

    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

    dbus = {
      enable = true;
      packages = with pkgs; [
        gnome.dconf-editor
        gnome2.GConf
      ];
    };
    
    environment.gnome.excludePackages = (with pkgs; [
      gnome-tour
      epiphany
    ])
      ++ (with pkgs.gnome; [
      hitori
      iagno
      gnome-music
      geary
      cheese
    ]);

    hardware.graphics = all-graphics // x86_64-graphics;
  };
}
