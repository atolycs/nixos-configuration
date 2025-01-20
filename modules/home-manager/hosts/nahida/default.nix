{ home-manager, ... }:
{
  home.file = {
    ".wallpaper/nahida.webp" = {
      source = ./nahida.webp;
    };
  };
}
