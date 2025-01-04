{
  "/boot" = {
    device = "/dev/disk/by-label/NIX-BOOT";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };
}

