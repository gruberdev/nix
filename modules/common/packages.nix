{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    alejandra
    git
    kitty
    curl
    wget
    firejail
    bubblewrap
  ];
}
