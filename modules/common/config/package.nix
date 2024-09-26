{ pkgs }:
{
  environment = {
    systemPackages = with pkgs; [
      github-cli
      git
      vim
      neovim
      gnome.gnome-terminal
      gnome.nautilus
      gnome.gnome-tweaks
      gnome.gnome-shell-extensions
      gnome.gnome-screenshot
      gnome.gnome-power-manager
      gnome.gnome-keyring
      gnome.gnome-disk-utility
      gnomeExtensions.user-themes
      gnomeExtensions.kimpanel
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
