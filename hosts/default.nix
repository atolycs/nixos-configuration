{
  config,
  hostname,
  hostProfile,
  self,
  inputs,
  ...
}:
{
  imports = [
    (./. + "/${hostProfile}/nixos.nix")
  ];

  nixpkgs.hostPlatform = builtins.currentSystem;

  system = {
    stateVersion = "24.11";
  };
}
