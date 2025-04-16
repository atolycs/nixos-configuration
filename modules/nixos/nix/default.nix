{
    nix = {
      settings = {
        auto-optimise-store = true;
        trusted-users = [
          "root"
          "@wheel"
        ];
      };
    };
    programs.nix-ld.enable = true;
}
