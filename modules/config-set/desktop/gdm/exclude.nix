{ pkgs, ... }:
{
  environment.gnome.excludePackages = (with pkgs; [ gnome-tour ]);
}
