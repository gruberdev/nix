{pkgs, ...}: {
  home.packages = with pkgs; [
    bisq2
    monero-cli
    p2pool
    monero-gui
  ];
}
