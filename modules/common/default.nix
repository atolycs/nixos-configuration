{ config, pkgs, username, ... }:
let
  boot = import ./config/boot.nix;
  sound = import ./config/sound.nix;
  hardware = import ./config/hardware.nix;
  users = import ./config/uses.nix { inherit pkgs username; } ;
  fonts = import ./config/fonts.nix;
in {
  system.stateVersion = "24.05";
  imports = [
    boot
    hardware
    fonts
    sound
    users 
  ]
}
