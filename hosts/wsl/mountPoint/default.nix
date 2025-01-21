{
  nixpkgs,
  modulesPath,
  ...
}:
{
  imports = [
    (import ./root.nix)
    (import ./boot.nix)
    (import ./home.nix)
  ];
}
