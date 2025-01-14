{
    hostname,
    stateSystem,
    lib,
    ...
}: {
    imports = [
      ./mountPoint
    ];

    networking = {
        hostName = "${hostname}";
    };

}
