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
        options = "--delete-older-than 7d";
      };
    };

    programs.nix-ld.enable = true;
  };
}
