{ pkgs, ... }:
let
  x86_64-graphics =
    if (!pkgs.stdenv.hostPlatform.isAarch64) then
      {
        enable32Bit = true;
      }
    else
      { };
  all-graphics = {
    enable = true;
  };
in
{
  environment.gnome.excludePackages = (
    with pkgs;
    [
      gnome-tour
      epiphany
      hitori
      iagno
      gnome-music
      geary
      cheese
    ]
  );

  hardware.graphics = all-graphics // x86_64-graphics;
}
