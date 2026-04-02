{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    bandwhich
    netscanner
  ];
}
