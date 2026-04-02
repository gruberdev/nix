{
  config,
  lib,
  pkgs,
  ...
}: {
  freelens = pkgs.callPackage ./freelens {}; # Disabled - slow build
  aptakube = pkgs.callPackage ./aptakube {};
  iopaint = pkgs.callPackage ./iopaint {
    inherit (pkgs) nodejs;
    npm = pkgs.nodePackages.npm;
  };
  claude = pkgs.callPackage ./claude {};
  sf-pro-rounded = pkgs.callPackage ./sf-pro-rounded {};
  monolisa = pkgs.callPackage ./monolisa {};
}
