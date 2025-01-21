{ ... }:
{
  fileSystems."/home" = {
    device = "/dev/disk/by-label/nixos-home";
    fsType = "ext4";
  };
}
