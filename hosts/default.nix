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

  nixpkgs.hostPlatform = builtins.currentSystem;

  system = {
    stateVersion = "24.11";
  };
}
