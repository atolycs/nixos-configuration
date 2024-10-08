{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "kimpanel@kde.org"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "dash-to-dock@micxgx.gmail.com"
        ];
        favorite-apps = [
          "firefox-esr.desktop"
          "org.gnome.Nautilius.desktop"
          "org.gnome.Console.desktop"
          "org.gnome.Settings.desktop"
        ];
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-position = "LEFT";
        extend-height = true;
        dash-max-icon-size = 32;
        custom-theme-shrink = true;
      };

      "org/gnome/desktop/session" = {
        idle-delay = 0;
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = false;
      };

      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
      };
    };
  };
}
