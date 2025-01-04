{
  profileName,
  stateVersion,
  pkgs,
  ...
}:
let
  flake = builtins.getFlake (toString ./.);
in 
{

   imports = [
    (import ./${profileName})
   ];


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


    packages = with pkgs; [
     zsh
    ];
}
