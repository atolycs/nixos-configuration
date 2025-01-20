{ pkgs, lib, ... }:
let
  packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.kimpanel
    gnomeExtensions.dash-to-dock
    xdg-utils
    xdg-desktop-portal-gnome
    gnome.gnome-tweaks
  ];
in with lib.hm.gvariant;
{
  config = {
    home.packages = packages;
    xdg.enable = true;

    programs.firefox = {
      enable = true;
      package = pkgs.firefox-esr;
      policies = {
        FirefoxHome = {
	  SponsoredTopSites = false;
	};
      };

    };

    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
        };

        "org/gnome/shell" = {
	  disable-user-extensions = false;
          enabled-extensions = [
            pkgs.gnomeExtensions.user-themes.extensionUuid
            pkgs.gnomeExtensions.kimpanel.extensionUuid
            pkgs.gnomeExtensions.dash-to-dock.extensionUuid
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

	"org/gnome/desktop/interface" = {
	  clock-show-seconds = true;
	  clock-show-weekday = true;
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
      };
    };
  };
}
