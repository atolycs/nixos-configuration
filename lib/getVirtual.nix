# {self, ...}:
# let
#   pkgs = self.inputs.nixpkgs.legacyPackages.${builtins.currentSystem};
#
#   detectVirt = builtins.trace "Detecting virtualization type..." (
#     builtins.readFile (
#       pkgs.writeScript "detect-virt.sh" ''
#         #!/bin/bash
#         ${pkgs.systemd}/bin/systemd-detect-virt || echo "none"
#       ''
#     )
#   );
# in {
#   config = {
#     virtualizationType = detectVirt;
#   };
# }

{ self, ... }:
let
  pkgs = self.inputs.nixpkgs.legacyPackages.${builtins.currentSystem};
  lib = self.inputs.nixpkgs.lib;
  detectScript = builtins.replaceStrings [ "\n" ] [ "" ] (
    builtins.readFile (
      pkgs.runCommand "detectVirt" { } ''
        (${pkgs.systemd}/bin/systemd-detect-virt || echo "none") > $out
      ''
    )
  );
in
{
  vmStat = detectScript;
}

# let
#   pkgs = self.inputs.nixpkgs.legacyPackages.${builtins.currentSystem};
#
#   detectVirtScript = pkgs.writeScript "detect-virt.sh" ''
#   #!/bin/bash
#     ${pkgs.systemd}/bin/systemd-detect-virt || echo "none"
#   '';
#
#   drv = derivation {
#       name = "getVirtual";
#       builder = "/bin/sh";
#       args = [ "-c" "${pkgs.systemd}/bin/systemd-detect-virt || echo 'none' > $out"];
#       system = builtins.currentSystem;
#       # buildCommand = ''
#       #   mkdir -p $out
#       #   result=$(${detectVirtScript})
#       #   echo $result >> $out/result
#       # '';
#   };
# in "${builtins.readFile drv}"

# in self.inputs.nixpkgs.legacyPackages.${builtins.currentSystem}.stdenv.mkDerivation {
# }
