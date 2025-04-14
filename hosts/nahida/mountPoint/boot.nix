{
  self, ...
}:with self; {
  imports = [
    #outputs.nixosModules.boot.systemd-boot
  ];

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/NIXOS-BOOT";
    fsType = "vfat";
  };
}
