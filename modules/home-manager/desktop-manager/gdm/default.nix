{
  outputs,
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.desktop-manager.gdm;
  packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.kimpanel
    gnomeExtensions.dash-to-dock
    xdg-utils
    xdg-desktop-portal-gnome
    gnome-tweaks
  ];
in
with lib.hm.gvariant;
with lib;
{

  imports = [
    outputs.nixosModules.programs.firefox-esr
  ];

  options = {
    desktop-manager.gdm = {
      packages = lib.mkOption {
        type = lib.types.nullOr (lib.types.listOf lib.types.package);
        default = [ ];
        description = "Additional Package list";
      };

      enable-plugins = lib.mkOption {
        type = lib.types.nullOr (lib.types.listOf lib.types.str);
        default = [ ];
        description = "Enable plugin list";
      };

      dconf = lib.mkOption {
        type = lib.types.nullOr (lib.types.attrs);
        default = { };
        description = "Additional dconf";
      };
    };
  };

  config = {
    home.packages = packages ++ cfg.packages;
    xdg.enable = true;

    #    programs.firefox = {
    #      enable = true;
    #      package = pkgs.firefox-esr;
    #      policies = {
    #        FirefoxHome = {
    #   SponsoredTopSites = false;
    # };
    #      };
    #
    #    };

    dconf = {
      enable = true;
      settings = lib.recursiveUpdate ({
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
        };

        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            pkgs.gnomeExtensions.user-themes.extensionUuid
            pkgs.gnomeExtensions.kimpanel.extensionUuid
            pkgs.gnomeExtensions.dash-to-dock.extensionUuid
          ] ++ cfg.enable-plugins;

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

        "org/gnome/desktop/interface" = {
          clock-show-seconds = true;
          clock-show-weekday = true;
        };

        "org/gnome/desktop/screensaver" = {
          lock-enabled = false;
        };

        "org/gnome/mutter" = {
          dynamic-workspaces = true;
        };

        "org/gtk/gtk4/settings/file-chooser" = {
          show-hidden = true;
        };

        "org/gtk/settings/file-chooser" = {
          show-hidden = true;
        };

        "org/gnome/nautilus/icon-view" = {
          default-zoom-level = "small-plus";
        };
      }) cfg.dconf;
    };
  };
}
