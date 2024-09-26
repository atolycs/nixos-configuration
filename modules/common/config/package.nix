{ pkgs }:
{
  environment.systemPackages = with pkgs; [
    github-cli
    git
    vim
    neovim
    (
      pkgs.wrapFirefox (pksg.firefox-unwrapped.override {
        pipewireSupport = true;
      }) {}
    )
  ]
}
