{
  config,
  hostname,
  hostProfile,
  inputs,
  lib,
  ...
}: {
  imports = [
    (./. + "/${hostProfile}/nixos.nix")
  ];
  
  nixpkgs.hostPlatform = builtins.currentSystem;

  system = {
    stateVersion = "24.11";
  };
}
