{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev:
      import ../../pkgs {
        config = config;
        lib = lib;
        pkgs = final;
      })
  ];
}
