{ ... }:
{
  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIX-BOOT";
    fsType = "vfat";
  };
}
