# Atolycs NixOS configuration

## How to install ?

```shell
$ nix-shell -p git
$ sudo nixos-install --no-root-password --flake .#minimal
$ sudo nixos-enter
[nix-chroot]# passwd atolycs
[nix-chroot]# exit
$ sudo umount -R /mnt
$ sudo reboot
```
