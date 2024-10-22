{
  inputs,
  outputs,
  stateVersion,
  ...
}:
{
  mkNixOS =
    {
      hostname,
      username ? "atolycs",
      desktop ? null,
      platform ? "x86_64-linux",
      virtual ? null,
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          desktop
          hostname
          username
          stateVersion
          virtual
          ;
      };
      modules = [ ../hosts ];
    };
}
