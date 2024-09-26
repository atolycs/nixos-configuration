{ config, pkgs, username, ... }:
let
  boot = import ./config/boot.nix;
  i18n = import ./config/i18n.nix;
  hardware = import ./config/hardware.nix;
  users = import ./config/users.nix { inherit pkgs username; } ;
  fonts = import ./config/fonts.nix { inherit pkgs; } ;
  programs = import ./config/programs.nix { inherit pkgs; };
  packages = import ./config/package.nix { inherit pkgs; };
  services = import ./config/services.nix;
  security = import ./config/security.nix;
  xdg = import ./config/xdg.nix { inherit pkgs; };
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
    security
    xdg
  ];
}
