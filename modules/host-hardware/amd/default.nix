{ modulesPath, ... }:
{
  imports = [
    (modulesPath + "/hardware/cpu/amd-microcode.nix")
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];
}
