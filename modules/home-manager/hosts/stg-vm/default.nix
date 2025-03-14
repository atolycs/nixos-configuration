{
  home-manager,
  lib,
  config,
  ...
}:
with lib.hm.gvariant;
{
  home.file = {
    ".wallpaper/arknights.jpg" = {
      source = ./arknights.jpg;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = mkString "file://${config.home.homeDirectory}/.wallpaper/arknights.jpg";
    };
  };
}
