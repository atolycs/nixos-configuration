{
  modulesPath,
  config,
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
      enable =  true;
     };
    };

    boot = {
      kernelParams = [
        "console=tty0"
        "console=ttyS0,115200n8"
      ];
      initrd.availableKernelModules = [
        "virtio_balloon"
        "virtio_blk"
        "virtio_pci"
        "virtio_ring"
      ];
    };
  };
}
