{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    yaak
    bruno
    bruno-cli
  ];
}
