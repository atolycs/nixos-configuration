{
  inputs,
  homeProfile,
  lib,
  self,
  ...
}:
{
  imports = [
    self.homeModules.default 
    ./${homeProfile}/home.nix
  ];

  home = {
    stateVersion = "25.05";
  };
}
