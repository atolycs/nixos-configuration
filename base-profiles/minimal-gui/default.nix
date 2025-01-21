{ outputs, ... }:
{
  imports = [
    outputs.nixosModules.desktop-profiles.gnome
    outputs.nixosModules.programs.vim
  ];
}
