{...}: {
  imports = [
    ./kubernetes
    ./ides
    ./android
    ./git
    ./db.nix
    ./tui.nix
    ./go.nix
    ./js.nix
    ./python.nix
    ./dotnet.nix
    ./web.nix
    ./cpp.nix
  ];
}
