{
  config,
  hostname,
  hostProfile,
  inputs,
  lib,
  ...
}: {
  imports = [
    ../modules/nixos
    (./. + "/${hostProfile}/nixos.nix")
  ];
  
  nixpkgs.hostPlatform = builtins.currentSystem;

  system = {
    stateVersion = "24.11";
  };
}
