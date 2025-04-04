{
  inputs,
  flakeRoot,
  ...
}@args:
let
  inherit (args) hostProfile hostname;
in
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      inputs
      hostname
      hostProfile
      ;
  };
  modules = [
    "${hostname}"
  ];
}
