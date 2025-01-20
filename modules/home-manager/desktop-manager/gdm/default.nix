{}: {
  config = {
    dconf = {
      enable = true;
      "org/gnome/shell/extensions/dash-to-dock" = {
        dock-position = "LEFT";
	extend-height = true;
	dash-max-icon-size = 32;
	custom-theme-shrink = true;
      };
    };
  };
}
