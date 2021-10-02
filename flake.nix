# note: this is for quick build troubleshotting rather than deployment
{
  inputs.fup.url = "github:gytis-ivaskevicius/flake-utils-plus/1.2.0";

  outputs = { self, fup, nixpkgs, ... }@inputs: fup.lib.mkFlake {
    inherit self inputs;

    outputsBuilder = channels: {
      defaultPackage = channels.nixpkgs.callPackage ./package.nix {};
    };
  };
}
