{ pkgs }:
{
  environment = {
    systemPackages = with pkgs; [
      github-cli
      git
      vim
      neovim
      (
        pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {
          pipewireSupport = true;
        }) {}
      )
    ];
    gnome.excludePackages = ( with pkgs; [
      gnome-tour
    ]) ++ ( with pkgs.gnome; [
      gnome-music
      gnome-terminal
      pkgs.gedit
    ]);
  };
}
