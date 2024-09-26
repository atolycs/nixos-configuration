{ config, pkgs, username, ... }:
let
  boot = import ./config/boot.nix;
  i18n = import ./config/i18n.nix;
  users = import ./config/users.nix { inherit pkgs username; } ;
  fonts = import ./config/fonts.nix { inherit pkgs; } ;
  services = import ./config/services.nix;
in {
  system.stateVersion = "24.05";
  imports = [
    boot
    fonts
    i18n
    users 
    services
  ];
}
