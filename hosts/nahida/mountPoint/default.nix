{
  nixpkgs,
  modulesPath,
  ...
}:
{
  imports = [
    ./root.nix
    ./boot.nix
    ./home.nix
  ];
}
