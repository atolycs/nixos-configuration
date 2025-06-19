{
  pkgs,
  ...
}:
{
  home = {
    programs = {
      firefox = {
        enable = true;
        profiles.default = {
          search.engine = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      vlaue = "{searchTerms}";
                    }
                  ];
                }
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "!np" ];
            };
            "Bing".metaData.hidden = true;
          };
        };
      };
    };
  };
}
