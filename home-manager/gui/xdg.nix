{ pkgs-stable, ... }:
{
  xdg = {
   enable = true;
  };

  home.packages = with pkgs-stable; [ xdg-utils ];
}
