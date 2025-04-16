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
    (flakeRoot + "/modules/config")
    (./. + "/${hostProfile}/nixos.nix")
    self.nixosModules.locale
    self.nixosModules.timezone.JST
  ];

  locale = {
    sortfix = true;
  };

  system = {
    stateVersion = "24.11";
  };
}
