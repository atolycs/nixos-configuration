{
    hostname,
    stateSystem,
    lib,
    ...
}: {
    imports = [
      ./mountPoint/
    ];

    network = {
        hostName = ${hostname};
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
