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

  locale.sortfix = true;
  nixpkgs.hostPlatform = "x86_64-linux";
}
