{ pkgs, ... }:
let
  packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.kimpanel
    gnomeExtensions.dash-to-dock
  ];
in
{
  config = {
    home.packages = packages;

    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
	};

        "org/gnome/shell" = {
          enabled-extensions = [
            pkgs.gnomeExtensions.user-themes.extensionUuid
	    pkgs.gnomeExtensions.kimpanel.extensionUuid
	    pkgs.gnomeExtensions.dash-to-dock.extensionUuid
	  ];
	};

        "org/gnome/shell/extensions/dash-to-dock" = {
          dock-position = "LEFT";
          extend-height = true;
          dash-max-icon-size = 32;
          custom-theme-shrink = true;
        };
      };
    };


  };
}
