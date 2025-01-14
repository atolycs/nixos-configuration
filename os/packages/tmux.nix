{
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
      set-window-option -g mode-keys vi
    '';
  };
}
