{
  description = "Deltabot : Bots manager for deltachat";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    flake-utils.url = "github:numtide/flake-utils";
    mach-nix.url = "github:DavHau/mach-nix?ref=3.3.0";
    deltabot-scr = {
      url = "https://files.pythonhosted.org/packages/c6/d7/90c24bbeef1e6b7e73dfe30e51e96699f5db05984497831ae2d87e93d9d4/deltabot-0.8.0.tar.gz"; 
      flake = false;};
    };

  outputs = { self, nixpkgs, flake-utils, mach-nix,deltabot-scr }:
  flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        python = "python38";
        pkgs = nixpkgs.legacyPackages.${system};
        mach-nix-wrapper = import mach-nix { inherit pkgs python; };
        requirements     = ''
          setuptools
          attrs
          deltachat
          '';
        pythonBuild      = mach-nix-wrapper.mkPython { inherit requirements; };
        deltabot         = mach-nix-wrapper.buildPythonPackage rec{
          version = "0.8.0";
          src = deltabot-scr;
          requirementsExtra =''
               setuptools
               attrs
               deltachat
              '';
        };
      in {
        devShell = pkgs.mkShell {
          buildInputs=[
            pythonBuild
          ];
        };
        
        defaultPackage= deltabot;
        packages= deltabot;
      }
  );

}
