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

    dbus.packages = with pkgs; [ gnome.dconf-editor ];
  };
  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-tour
      hitori
      iagno
      gnome-music
      epiphany
      geary
    ]
  );
}
