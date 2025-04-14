{ self, ... }:
with self;
{
  imports = [
    outputs.nixosPresets.kvm
    outputs.nixosModules.boot.systemd-boot
    ./mountPoint
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
