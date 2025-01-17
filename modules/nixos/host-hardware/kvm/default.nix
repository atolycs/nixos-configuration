{
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/virtualisation/qemu-guest-agent.nix")
    (modulesPath + "/services/misc/spice-vdagentd.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
  ];
  config = {
    services = {
      qemuGuest = {
        enable = true;
      };
      spice-vdagentd = {
        enable = true;
      };
    };
    boot.kernelParams = [
      "console=tty0"
      "console=ttyS0,115200n8"
    ];
    boot.initrd.availableKernelModules = [
      "virtio_balloon"
      "virtio_blk"
      "virtio_pci"
      "virtio_ring"
    ];
  };
}
