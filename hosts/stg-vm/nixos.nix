# this is test template
{ self, ... }:
with self;
{
  imports = [
    self.nixosPresets.kvm
    self.nixosPresets.vmware
    self.nixosModules.boot.systemd-boot
    self.nixosModules.desktop-profiles.gdm
    ./mountPoint
  ];
  atlConfig.user.enable = true;
  networking.hostName = "atlas";
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
  #nixpkgs.hostPlatform = "x86_64-linux";
  #nixpkgs.system = builtins.currentSystem;
  nixpkgs.hostPlatform = "x86_64-linux";
}
