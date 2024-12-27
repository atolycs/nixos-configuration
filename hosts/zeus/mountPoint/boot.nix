{
  fileSystems."/boot" = {
      device = "/dev/disk/by-label/NIXOS-BOOT";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
  };
}
