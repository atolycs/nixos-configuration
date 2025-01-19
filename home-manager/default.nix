{
  inputs,
  outputs,
  homeProfile,
  stateVersion,
  ...
}:
{
  imports = [
   ./${homeProfile}/home.nix
   outputs.homeModules.nahida
  ];

  home = {
    inherit stateVersion;
  };
}
