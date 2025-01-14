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
  imports = [
    (./. + "/${hostProfile}/nixos.nix")
  ];

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

  nixpkgs.hostPlatform = "x86_64-linux";
}
