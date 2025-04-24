{
  config,
  hostname,
  hostProfile,
  self,
  flakeRoot,
  inputs,
  ...
}:
{
  imports = [
    (flakeRoot + "/features/nixos")
    self.nixosModules.locale
    self.nixosModules.timezone.JST
    self.nixosModules.nix
    self.nixosModules.fonts

    # Add Custom module before this line

    (./. + "/${hostProfile}/nixos.nix")
  ];

  locale = {
    sortfix = true;
  };

  system = {
    stateVersion = "24.11";
  };
}
