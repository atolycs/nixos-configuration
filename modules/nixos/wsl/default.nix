{ inputs, ... }:{
  imports = [
    inputs.nixos-wsl.nixosModules.wsl
  ];

  config = {
   wsl = {
     enable = true;
     nativeSystemd = true;
   };
  };
}
