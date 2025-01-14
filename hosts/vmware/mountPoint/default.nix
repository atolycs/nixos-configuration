{
  nixpkgs,
  ...
}:
{
  imports = [
    ./root.nix
    ./boot.nix
    ./home.nix
  ];
}
