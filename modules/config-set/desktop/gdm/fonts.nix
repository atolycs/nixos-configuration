{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-emoji-serif
      "${pkgs.fetchzip {
          url = "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/0xProto.zip";
      }}"
    ];
    fontDir.enable = true;

  };
}
