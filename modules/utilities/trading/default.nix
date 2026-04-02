{pkgs, ...}: {
  home.packages = with pkgs; [
    ticker
  ];
  imports = [
    ./crypto.nix
  ];
}
