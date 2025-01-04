{
  profileName,
  stateVersion,
  hostname,
  platform,
  pkgs,
  ...
}:
let
  flake = builtins.getFlake (toString ./.);
in
{

  imports = [
    (./${profileName}/nixos.nix)
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

  networking = {
    hostName = "${hostname}";
  };

  packages = with pkgs; [
    zsh
  ];

  nixpkgs.hostPlatform = "${platform}";
}
