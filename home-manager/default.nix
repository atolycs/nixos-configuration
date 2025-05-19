{
  inputs,
  homeProfile,
  lib,
  ...
}:
{
  imports = [
    ./${homeProfile}/home.nix
  ];

  home = {
    stateVersion = "25.05";
  };
}
