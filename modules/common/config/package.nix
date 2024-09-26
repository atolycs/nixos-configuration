{ pkgs }:
{
  environment.systemPackages = with pkgs; [
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
}
