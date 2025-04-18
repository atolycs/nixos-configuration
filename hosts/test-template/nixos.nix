# this is test template
{ self, ... }:
with self;
{
  imports = [
    self.nixosModules.boot.systemd-boot
    self.nixosPresets.kvm
    self.nixosModules.boot.systemd-boot
    self.nixosModules.desktop-profiles.gdm
    ./mountPoint
  ];


  # atlConfig.bindfs = 
  #   {
  #     enable = true;
  #   mounts = {
  #   "/home/atolycs/test" = {
  #     mountFrom = "/test";
  #     fsType = "tmpfs";
  #   };
  #   "/home/atolycs/test2" = {
  #     mountFrom = "/test2";
  #     fsType = "tmpfs";
  #   };
  #  };
  #   };

  locale.sortfix = true;
  nixpkgs.hostPlatform = "x86_64-linux";
}
