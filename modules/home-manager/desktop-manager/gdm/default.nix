{ ... }:
{
  config = {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,maximize,close";
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
