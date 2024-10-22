{
  inputs,
  pkgs,
  username,
  desktopManager,
  hostname,
  ...
}:
let
  desktop = {
    "gdm" = [ (import ../../modules/config-set/desktop/gdm) ];
  };
in
{
  imports = [
    ./hardware-configuration.nix

    ../../modules/core
    ../../modules/programs/nix-ld.nix
    ../../modules/programs/git.nix
    ../../modules/programs/neovim.nix
  ] ++ (desktop.${desktopManager} or [ ]);

  networking.hostName = "${hostname}";
  system.stateVersion = "24.05";
  users.users."${username}" = {
    isNormalUser = true;
    shell = pkgs.bash;
    extraGroups = [
      "wheel"
      "libvirt"
      "audio"
      "video"
    ];
    packages = with pkgs; [
      gnomeExtensions.user-themes
      gnomeExtensions.kimpanel
    ];
  };
}
