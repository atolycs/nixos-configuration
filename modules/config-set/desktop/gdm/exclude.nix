{ pkgs, ... }:
{
  environment.gnome.excludePackages =
    (with pkgs; [
      gnome-tour
      epiphany
    ])
    ++ (with pkgs.gnome; [
      hitori
      iagno
      gnome-music
      geary
    ]);
}
