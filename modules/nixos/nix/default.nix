{
  config,
  ...
}:
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
}
