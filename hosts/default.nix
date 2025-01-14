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
    ../os/boot
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

}
