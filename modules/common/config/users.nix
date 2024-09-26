{ pkgs, username }: {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
     "wheel"
     "video"
     "audio"
     "kvm"
     "libvirt"
    ];
    shell = pkgs.zsh;
    useDefaultShell = true;
    packages = with pkgs; [
      gnomeExtensions.user-themes
      gnomeExtensions.kimpanel
    ];
  };
}
