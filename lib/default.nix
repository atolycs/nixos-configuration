{
  inputs,
  outputs,
  home-manager,
  stateVersion,
  ...
}:
let
  mkNixos = import ./mkNixos.nix { inherit inputs outputs stateVersion; };
  mkHomeManager = import ./mkHome.nix {
    inherit
      inputs
      outputs
      stateVersion
      home-manager
      ;
  };
in
{
  inherit (mkNixos) mkNixos;
  inherit (mkHomeManager) mkHomeManager;
}
