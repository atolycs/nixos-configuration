{
    inputs,
    outputs,
    stateVersion,
    ...
}:
let
    mkNixos = import ./mkNixos.nix { inherit inputs outputs stateVersion; };
in 
{
    inherit (mkNixos);
};
