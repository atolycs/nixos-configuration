{
  fileSystems."/var" = {
      device = "/dev/disk/by-label/nixos-varfs";
      fsType = "ext4";
      options = ["default"]
  };
}
