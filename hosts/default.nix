{
  config,
  hostname,
  hostProfile,
  self,
  flakeRoot,
  inputs,
  ...
}:
{
  imports = [
    (flakeRoot + "/modules/config")
    (./. + "/${hostProfile}/nixos.nix")
  ];
  system = {
    stateVersion = "24.11";
  };
}
