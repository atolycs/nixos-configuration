{
    inputs,
    outputs,
    stateVersion,
    ...
  }: {
      mkNixos = {
          hostname,
          username ? "atolycs",
          desktop ? null,
          platform ? "x86_64-linux"
        }: let 
          self = outputs;
      in
        inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {
                inherit 
                  inputs
                  outputs
                  hostname
                  username
                  stateVersion
              };
              modules = [ ../hosts ];
        };
}
