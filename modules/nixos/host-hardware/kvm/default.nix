{
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/virtualisation/qemu-guest-agent.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  boot.initrd.availableKernelModules = [
    "virtio_balloon"
    "virtio_blk"
    "virtio_pci"
    "virtio_ring"
  ];
}
