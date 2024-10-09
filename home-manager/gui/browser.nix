{ pkgs-stable, ... }:
{
  programs = {
    firefox = {
      enable = true;
      package = pkgs-stable.firefox-esr;
      policies = {
        ExtensionSettings = {
          "uBlock0@raymondhill.net" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            installation_mode = "normal_installed";
          };
        };
      };
    };
  };
}
