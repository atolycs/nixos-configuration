{ config, pkgs, username, ... }:
let
  boot = import ./config/boot.nix;
  i18n = import ./config/i18n.nix;
  hardware = import ./config/hardware.nix;
  users = import ./config/users.nix { inherit pkgs username; } ;
  fonts = import ./config/fonts.nix { inherit pkgs; } ;
  programs = import ./config/programs.nix;
  packages = import ./config/package.nix;
  services = import ./config/services.nix;
  xdg = import ./config/xdg.nix;
in {
  system.stateVersion = "24.05";
  imports = [
    boot
    hardware
    fonts
    i18n
    programs
    packages
    users
    services
    xdg
  ];
}
