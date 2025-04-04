{
  inputs,
  ...
}@args:
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit
      args
      inputs
      ;
  };

  modules = [
  ];
}
