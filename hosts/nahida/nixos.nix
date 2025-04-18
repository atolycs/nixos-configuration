{ self, ... }:
with self;
{
  imports = [
    self.nixosModules.boot.systemd-boot
    self.nixosPresets.kvm
    self.nixosPresets.minimal-gui
    ./mountPoint
  ];

  locale.sortfix = true;

  networking.hostName = "nahida";

  nixpkgs.hostPlatform = "x86_64-linux";
}
