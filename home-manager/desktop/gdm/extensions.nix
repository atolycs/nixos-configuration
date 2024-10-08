{ pkgs, username, ... }:
{
  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.kimpanel
    gnomeExtensions.dash-to-dock
  ];
}
