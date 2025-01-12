{
    nixpkgs,
    ...
}:
let
  inherit (nixpkgs.lib.filesystem) listFilesRecursive;

  import_list = listFilesRecursive .;
in 
{
  import = [
   ./root.nix
   ./boot.nix
   ./home.nix
  ];
}
