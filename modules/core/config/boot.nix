{
  boot = {
#    kernelModules = [ "kvm-amd" "kvm-intel" ];
    hardwareScan = true;

    loader = {
      systemd-boot = {
        enable = true;
	graceful = true;
      };
      efi.canTouchEfiVariables = true;
    };

    kernel.sysctl = {
      "kernel.sysrq" = 1;
    };
  };
}
