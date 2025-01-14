{
    hostname,
    stateSystem,
    lib,
    ...
}: {
    imports = [
      ./mountPoint
    ];

    network = {
        hostName = ${hostname};
    };

}
