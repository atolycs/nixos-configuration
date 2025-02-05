{
  hostProfile,
  hostname,
  stateVersion,
  username,
  outputs,
  inputs,
  ...
}:
let
  flake = builtins.getFlake (toString ./.);
in
{
  imports = [
    outputs.nixosModules.programs.cloudflared
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
