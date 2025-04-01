{
  modulesPath,
  ...
}:
{
  imports = [
    (modulesPath + "/virtualisation/qemu-guest-agent.nix")
  ];
  config = {
    services = {
      qemuGuest = {
        enable = true;
      };
    };
  };

}
