{ lib, ... }:
with lib.hm.gvariant;
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
          "org.gnome.Nautilus.desktop"
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
        idle-delay = mkUint32 0;
      };

      "org/gnome/mutter" = {
        dynamic-workspaces = true;
      };

      "org/gnome/desktop/interface" = {
        clock-show-seconds = true;
        clock-show-weekday = true;
      };

      "org/gnome/desktop/input-sources" = {
        sources = [
          (mkTuple [ "xkb" "us" ])
          (mkTuple [ "fcitx5" "mozc-jp" ])
        ];
      };

      "org/gtk/gtk4/settings/file-chooser" = {
        show-hidden = true;
      };
      "org/gtk/settings/file-chooser" = {
        show-hidden = true;
      };
    };
  };
}
