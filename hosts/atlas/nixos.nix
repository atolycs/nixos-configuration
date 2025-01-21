{
  hostname ? "atlas",
  stateSystem,
  lib,
  config,
  modulesPath,
  outputs,
  ...
}:
{
  imports = [
    outputs.nixosProfiles.vmware
    outputs.nixosModules.nix
    outputs.nixosModules.boot.systemd
    outputs.nixosModules.ssh
    outputs.nixosModules.programs.git
    outputs.nixosProfiles.minimal-gui
    outputs.nixosModules.users.atolycs

    ./mountPoint
    ../../os/boot
    ../../os/security
    ../../os/locale
    ../../os/systemd/systemd.nix
  ];

  networking = {
    hostName = "atlas";
  };

  nixpkgs.hostPlatform = "x86_64-linux";

  boot = {
    initrd = {
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "sd_mod"
      ];
    };
  };

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
