{ home-manager, lib, config, ... }:
with lib.hm.gvariant;
{
  home.file = {
    ".wallpaper/nahida.webp" = {
      source = ./nahida.webp;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = mkString "file://${config.home.homeDirectory}/.wallpaper/nahida.webp";
    };
  };
}
