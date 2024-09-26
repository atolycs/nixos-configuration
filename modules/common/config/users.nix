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
  };
}
