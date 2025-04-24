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
    stateVersion = "24.11";
  };
}
