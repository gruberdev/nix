{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./easyeffects.nix
  ];
  home.packages = with pkgs; [
  ];
}
