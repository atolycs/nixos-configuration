{
  home-manager,
  lib,
  config,
  ...
}:
let
  cfg = config.desktop-manager;

in
with lib.hm.gvariant;
{
  # options = {
  #   sync-wallpaper = {
  #      type = lib.types.bool;
  #      default = false;
  #      description = "Sync colorscheme wallpaper";
  #   };
  # };
  # config = {
  home.file = {
    ".wallpaper/nahida.webp" = {
      source = ./nahida.webp;
    };
  };

  dconf.settings = { } // {
    "org/gnome/desktop/background" = {
      picture-uri = mkString "file://${config.home.homeDirectory}/.wallpaper/nahida.webp";
      picture-uri-dark = mkString "file://${config.home.homeDirectory}/.wallpaper/nahida.webp";
    };
  };
  # };
}
