{ self, ... }:
{
  imports = [
    self.nixosModules.desktop-profiles.gdm
    self.nixosModules.programs.vim
  ];
}
