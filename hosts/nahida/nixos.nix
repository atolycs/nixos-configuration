{
  hostname,
  stateSystem,
  lib,
  config,
  modulesPath,
  outputs,
  home-manager,
  ...
}:
{
  imports = [
    ./mountPoint
    outputs.nixosProfiles.minimal-gui
    outputs.nixosProfiles.kvm
    outputs.nixosModules.nix
    outputs.nixosModules.ssh
    outputs.nixosModules.boot.systemd

    outputs.nixosModules.users.atolycs
    outputs.nixosModules.programs.git

    (modulesPath + "/installer/scan/not-detected.nix")
    ../../os/boot
    ../../os/security
    ../../os/locale
    ../../os/systemd/systemd.nix
  ];

  networking = {
    hostName = "nahida";
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
