{
  stateVersion,
  ...
}:
let
  flake = builtins.getFlake (toString ./.);
in 
{
  nix = {
      settings = {
          experimental-features = "flakes nix-command";
          trusted-users = [
            "root"
	    "@wheel"
            "atolycs"
          ];
        };
    };

    system = {
        inherit stateVersion;
    };
}
