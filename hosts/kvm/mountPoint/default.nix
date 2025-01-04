{ pkgs, ... }:
{
  fileSystems = [
    import
    ./boot.nix
    import
    ./home.nix
    import
    ./root.nix
  ];
}
