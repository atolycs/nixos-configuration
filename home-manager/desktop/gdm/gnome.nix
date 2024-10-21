{ pkgs-stable, ... }:
{
  home.packages = with pkgs-stable; [
    gnome.gnome-tweaks
  ];
}
