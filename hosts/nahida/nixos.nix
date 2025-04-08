{ self, ... }:
with self;
{
  imports = [
    outputs.nixosPresets.kvm

    ./mountPoint
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
