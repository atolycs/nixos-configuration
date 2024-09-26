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
  };
}
