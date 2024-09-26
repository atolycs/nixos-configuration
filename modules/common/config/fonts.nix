{ pkgs }: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
     noto-fonts
     noto-fonts-cjk-sans
     noto-fonts-cjk-serif
     noto-fonts-color-emoji
     noto-fonts-monochrome-emoji
    ];
    fontconfig = {
     defaultFonts = {
       serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
       sansSerif = ["Noto Sans CJK JP" "NotoColor Emoji"];
       emoji = ["Noto Color Emoji"];
     };
    };
  };
}
