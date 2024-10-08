{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-cjk-serif
      noto-fonts-emoji-serif
      (nerdfonts.override { fonts = [ "0xProto" ]; })
    ];
    fontDir.enable = true;

  };
}
