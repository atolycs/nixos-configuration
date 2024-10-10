{ pkgs-stable, ... }:
{
  programs = {
    neovim = {
      enable = true;
    };
  };

  home.packages = with pkgs-stable; [
    gcc
    cargo
    rustc
    rustfmt
  ];
}
