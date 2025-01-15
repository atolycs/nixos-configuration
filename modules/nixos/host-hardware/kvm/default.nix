{
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/virtualisation/qemu-guest-agent.nix")
  ];
  boot.initrd.availableKernelModules = [
    "virtio_balloon"
    "virtio_blk"
    "virtio_pci"
    "virtio_ring"
  ];
}
