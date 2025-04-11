{self, ...}:
with self;
{
  imports = [
    ./mountPoint
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
}
