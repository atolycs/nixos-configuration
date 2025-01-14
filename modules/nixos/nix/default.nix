{
  outputs,
  lib,
  config,
  inputs,
  ...
}:
{
  config = {
    nixpkgs = {
      config = {
        allowUnfree = true;
        allowUnsupportedSystem = true;
      };
    };
    nix = {
      settings = {
        auto-optimise-store = true;
        trusted-users = [
          "root"
          "@wheel"
        ];
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-tahn 14d";
      };
    };
  };
}
