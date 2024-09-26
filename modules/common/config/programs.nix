{ pkgs, lib, ... }:
{
  programs = {
    zsh.enable = true;
    tmux.enable = true;

    firefox = {
      enable = true;
      package = pkgs.firefox-esr;
      policies = {
       ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
	  install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
	  installation_mode = "force_installed";
	};
       };
      };
    };

    gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
    };

    nix-ld = {
      enable = true;
      libraries = with pkgs; [];
    };

    dconf = {
      enable = true;
      profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/wm/preferences" = {
            button-layout = "appmenu:minimize,maximize,close";
          };
         "org/gnome/shell" = {
           disable-user-extensions = false;
           enabled-extensions = [
	    "kimpanel@kde.org"
	    "user-theme@gnome-shell-extensions.gcampax.github.com"
           ];
         };
        };
      }
     ];
    };
  };
}
