{
    hostname,
    ...
}: {
    import = [
      ./mountPoint/
    ];

    network = {
        hostName = ${hostname};
    };
  }
