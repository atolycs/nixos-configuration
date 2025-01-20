{ pkgs, ... }: {
  config = {
  system.fsPackages = with pkgs; [
    bindfs    
  ];
  };
}
