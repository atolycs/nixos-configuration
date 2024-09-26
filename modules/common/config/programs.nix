{ pkgs }:
{
  programs = {
    zsh.enable = true;

    firefox = {
      enable = true;
      package = pkgs.firefox-esr;
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
           "org/gnome/shell" = {
	     disable-user-extensions = false;
	     enabled-extensions = with pkgs.gnomeExtensions; [
                "kimpanel@kde.org"
	     ];
	   };
	  };
	}
      ];
    };
  };
}
