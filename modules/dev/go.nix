{pkgs, ...}: {
  home.packages = with pkgs; [
    go
    gotests
    fm-go
  ];
}
