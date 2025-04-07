args@{ ... }:
# https://discourse.nixos.org/t/import-from-files-dirs/36372/3
{ hostname, hostProfile }:
with args;
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      inputs
      hostProfile
      hostname;
  };

  modules = [
    (hostRoot + ./. + "/nixos.nix")
  ];
}
