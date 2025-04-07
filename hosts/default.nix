{
  hostname,
  hostProfile,
  inputs,
  lib,
...
}: {
  stateVersion = "24.11";
  imports = [
    (./. + "/${hostProfile}/nixos.nix")
  ];
}
