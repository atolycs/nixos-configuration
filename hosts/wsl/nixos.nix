{
  hostname,
  stateVersion,
  lib,
  config,
  modulesPath,
  inputs,
  outputs,
  home-manager,
  ...
}:
{
  imports = [

    outputs.nixosModules.nix
    outputs.nixosModules.ssh

    outputs.nixosModules.wsl

    outputs.nixosModules.users.atolycs
    outputs.nixosModules.programs.git

    ../../os/security
    ../../os/locale
  ];

  networking = {
    hostName = "rhodes-mobile";
  };

  nixpkgs.hostPlatform = "x86_64-linux";

  # boot = {
  #   initrd = {
  #     availableKernelModules = [
  #       "nvme"
  #       "xhci_pci"
  #       "sd_mod"
  #     ];
  #   };
  # };

}
