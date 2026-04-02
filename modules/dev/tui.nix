{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    ctop
    posting
    rainfrog
    s-tui
    soft-serve
    stu
    devpod
    docker
    docker-compose
  ];
}
