{
  boot = {
    initrd.availableKernelModules = [
      "virtio_blk"
      "virtio_pci"
      "virtio_ring"
      "ata_piix"
    ];
  };
}
