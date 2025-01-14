{
  hostname,
  stateSystem,
  lib,
  config,
  modulesPath,
  ...
}:
{
  imports = [
    ./mountPoint
    ../../os/boot
    ../../os/security
    ../../os/locale
    ../../os/systemd/systemd.nix
    (modulesPath + "/virtualisation/vmware-guest.nix")
  ];

  networking = {
    hostName = "${hostname}";
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
}
