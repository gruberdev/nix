{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    seabird
    kubeshark
  ];
}
