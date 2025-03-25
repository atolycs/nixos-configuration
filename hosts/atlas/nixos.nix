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

    outputs.nixosModules.serial
    outputs.nixosModules.locale
    outputs.nixosModules.timezone.JST
    ./mountPoint
    ../../os/boot
    ../../os/security
    ../../os/systemd/systemd.nix
  ];

  locale = {
    additional = [ "ja_JP.UTF-8/UTF-8" ];
    sortfix = true;
  };
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

  programs.cloudflared.enable = true;
}
