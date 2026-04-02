{pkgs, ...}: {
  home.packages = with pkgs; [
    mongodb-compass
    mongodb-cli
    mongodb-tools
    vi-mongo

    dbeaver-bin
    atlas

    pgcli
    postgresql
    pgbadger
    pgadmin4-desktopmode

    lazysql
  ];
}
