{ outputs, ... }:
{
  imports = [
    outputs.nixosModules.boot.systemd
  ];
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS-BOOT";
    fsType = "vfat";
  };
}
