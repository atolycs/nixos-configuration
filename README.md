# Atolycs Nixos configuration
# WIP


Pre-Stable commit Hash: `bbd7c1a`

## Hosts List
```shell
nix flake show github:atolycs/nixos-configuration
```

## How to active ?

* OS install
```shell
mount /dev/disk/by-label/nixos-root /mnt
mount --mkdir /dev/disk/by-label/nixos-home /mnt/home
mount --mkdir /dev/disk/by-label/NIXOS-BOOT /mnt/boot
sudo nixos-install --root /mnt --flake github:atolycs/nixos-configuration#<host list> --show-trace
umount -R /mnt
reboot
```

* OS rebuild
```shell
sudo nixos-rebuild --flake github:atolycs/nixos-configuration#<host> --show-trace
reboot
```

* Home manager
```shell
nix develop github:atolycs/nixos-configuration
home-manager switch --flake github:atolycs/nixos-configuration#<username>@<host> --show-trace
reboot
```
