# note: this is for quick build troubleshotting rather than deployment
{
  inputs.fup.url = "github:gytis-ivaskevicius/flake-utils-plus/1.2.0";

  outputs = { self, fup, nixpkgs, ... }@inputs: fup.lib.mkFlake {
    inherit self inputs;

    outputsBuilder = channels: {
      packages.default = channels.nixpkgs.callPackage ./package.nix {};
    };
  
    # Sorry I don't have Darwin machines
    herculesCI.ciSystems = [ "x86_64-linux" "aarch64-linux" ];
  };
}
