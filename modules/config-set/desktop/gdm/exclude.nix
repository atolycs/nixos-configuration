{ pkgs, ... }:
{
  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-tour
      gnome.hitori
      iagno
      gnome-music
      epiphany
      geary
    ]
  );
}
