{
  hostProfile,
  hostname,
  stateVersion,
  username,
  ...
}:
let
  flake = builtins.getFlake (toString ./.);
in
{
 
  nix = {
    optimise.automatic = true;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      trusted-users = [
        "root"
        "@wheel"
        "${username}"
      ];
    };
  };

  system = {
    inherit stateVersion;
  };

  import = [
    (./. + "/${hostProfile}/nixos.nix")
  ];
}
