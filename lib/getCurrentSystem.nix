{
  self,
  ...
}:
let
  lib = self.inputs.nixpkgs.lib;
  detectScript = builtins.replaceStrings [ "\n" ] [ "" ] (
    builtins.readFile (
      pkgs.runCommand "detectCurrentSystem" { } ''
        (echo "$(${pkgs.coreutils}/bin/uname -m)-$(${pkgs.coreutils}/bin/uname -s)") > $out
      ''
    )
  );
in
lib.toLower detectScript
