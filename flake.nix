{
  description = "Flake for chisel-lab";

  inputs = {
    pkgs.url = "pkgs";
  };

  outputs = {
    self,
    pkgs,
  }: let
    stdpkgs = pkgs.legacyPackages.x86_64-linux;
  in {
    formatter.x86_64-linux = stdpkgs.alejandra;

    devShells.x86_64-linux.default = stdpkgs.mkShell {
      name = "chisel-lab-shell";
      packages = [
        stdpkgs.mill # scala project builder
        stdpkgs.temurin-bin # JDK
        stdpkgs.metals # scala lsp
        stdpkgs.verible
      ];
    };
  };
}
