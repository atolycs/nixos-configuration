{
  inputs,
  outputs,
  homeProfile,
  ...
}: {
  imports = [
   (./. + "${homeProfile}/home-manager.nix")
  ];
}
