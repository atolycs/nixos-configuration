
{ pkgs, ... }:
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs.firefox-esr;
      policies = {
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "normal_installed";
          };
          "@testpilot-containers" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/multi-account-containers/latest.xpi";
            installation_mode = "normal_installed";
          };
        };

        FirefoxHome = {
          SponsoredTopSites = false;
        };

        SearchEngines = {
          Default = "DuckDuckGo";
        };

        ShowHomeButton = true;
        PromptForDownloadLocation = true;
        DontCheckDefaultBrowser = true;
      };
    };
  };
}
