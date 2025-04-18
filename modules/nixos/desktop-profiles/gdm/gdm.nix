{pkgs, ...}:
{
  services = {
    accounts-daemon.enable = true;
    udev.packages = with pkgs; [ gnome-settings-daemon ];
    gnome = {
      gnome-browser-connector.enable = true;
    };

    xserver = {
      excludePackages = with pkgs; [ xterm ];
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
        autoSuspend = false;
      };

      desktopManager.gnome = {
        enable = true;
        extraGSettingsOverridePackages = with pkgs; [
          gsettings-desktop-schemas
          gnome-shell
        ];
      };
    };
  };
}
