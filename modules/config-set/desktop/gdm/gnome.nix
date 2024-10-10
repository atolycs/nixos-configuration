{ pkgs, ... }:
{
  services = {
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      desktopManager = {
        gnome.enable = true;
        runXdgAutostartIfNone = true;
      };
    };

    dbus.packages = with pkgs; [
      gnome3.dconf
    ];
  };
}
