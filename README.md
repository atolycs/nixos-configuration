# Atolycs NixOS configuration

## How to install ?

```shell
$ nix-shell -p git neovim github-cli

# mount disks

# expand rw store size
$ sudo mount -o remount,size=10G,noatime /nix/.rw-store
$ sudo nixos-install --no-root-password --flake .#minimal
$ sudo nixos-enter
[nix-chroot]# passwd atolycs
[nix-chroot]# exit
$ sudo umount -R /mnt
$ sudo reboot
```
