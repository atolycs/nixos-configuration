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


  atlConfig.mounts = {
    "/test" = {
      mountTo = "/home/atolycs/test";
      fsType = "tmpfs";
    };
  };

  locale.sortfix = true;
  nixpkgs.hostPlatform = "x86_64-linux";
}
