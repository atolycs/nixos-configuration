{
  hostname,
  stateSystem,
  lib,
  config,
  modulesPath,
  outputs,
  home-manager,
  ...
}:
let
  secretspath = builtins.toString outputs.inputs.mysecrets;
in
{
  imports = [
    ./mountPoint
    outputs.inputs.sops-nix.nixosModules.sops
    outputs.nixosProfiles.minimal-gui
    outputs.nixosProfiles.kvm
    outputs.nixosModules.nix
    outputs.nixosModules.ssh
    outputs.nixosModules.boot.systemd

    outputs.nixosModules.users.atolycs
    outputs.nixosModules.programs.git

    outputs.nixosModules.locale
    outputs.nixosModules.timezone.JST

    (modulesPath + "/installer/scan/not-detected.nix")
    ../../os/boot
    ../../os/security
    ../../os/locale
    ../../os/systemd/systemd.nix
  ];

  sops = {
   defaultSopsFile = "${secretspath}/secret1.yml";
   validateSopsFiles = false;
   age = {
     sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
     keyFile = "/var/lib/sops-nix/key.txt";
     generateKey = true;
   };

   secrets = {
    example_test = { };
   };
  };

  locale = {
    sortfix = true;
  };

  networking = {
    hostName = "nahida";
  };
  nixpkgs.hostPlatform = "x86_64-linux";

  # boot = {
  #   initrd = {
  #     availableKernelModules = [
  #       "nvme"
  #       "xhci_pci"
  #       "sd_mod"
  #     ];
  #   };
  # };

}
