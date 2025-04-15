{ self, ... }:
with self;
{
  imports = [
    outputs.nixosPresets.kvm
    self.nixosModules.boot.systemd-boot
    self.nixosModules.desktop-profiles.gdm
    ./mountPoint
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
