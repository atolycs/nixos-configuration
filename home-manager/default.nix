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
  ];

  home = {
    inherit stateVersion;
  };
}
