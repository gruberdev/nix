{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./tui.nix
  ];
  home.packages = with pkgs; [
    bandwhich
    dig
    hostctl
    mkcert
    netop
    netscanner
    nettools
    networkd-dispatcher
    networkmanagerapplet
    openvpn
    pcapc
    sniffnet
    speedtest-cli
    tldx
    trippy
  ];
}
