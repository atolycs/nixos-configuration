{
  pkgs,
  ...
}:
{
  config = {
    fonts = {
      packages = with pkgs; [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-emoji
        noto-fonts-color-emoji
        noto-fonts-cjk-serif
        (nerdfonts.override {
          fonts = [ "JetBrainsMono" ];
        })
      ];

      fontDir.enable = true;

      fontconfig = {
        defaultFonts = {
          serif = [
            "Noto Serif CJK JP"
            "Noto Color Emoji"
          ];

          sansSerif = [
            "Noto Sans CJK JP"
            "Noto Color Emoji"
          ];

          monospace = [
            "JetBrainsMono Nerd Font"
            "Noto Color Emoji"
          ];

          emoji = [ "Noto Color Emoji" ];
        };
      };
    };
  };
}
