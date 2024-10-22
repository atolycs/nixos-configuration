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
    let
      #kind = builtins.substring 0 (builtins.sub (builtins.stringLength hostname) 6) hostname;
      kind = inputs.self;
    in
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
           kind
           ;
       };
       modules = [ ../hosts ];
     };
}
