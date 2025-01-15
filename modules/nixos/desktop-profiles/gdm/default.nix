{ pkgs, ... }: {
  config = {

    services = {
      gnome = {
        gnome-browser-connector.enable = true;
      };
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
    ]);
  };
}
