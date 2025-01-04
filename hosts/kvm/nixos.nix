{
    hostname,
    ...
}: {
    import = [
      ./disks.nix
    ];

    network = {
        hostName = ${hostname};
    };

}
