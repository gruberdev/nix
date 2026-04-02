{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    ./sops.nix
  ];

  home = {
    username = config.username;
    homeDirectory =
      {
        x86_64-linux = "/home/${config.username}";
        aarch64-linux = "/home/${config.username}";
        aarch64-darwin = "/Users/${config.username}";
      }
      .${
        system
      };
    packages = with pkgs; [
      home-manager
      zip
      xz
      gnumake
      sops
      appimage-run
      age
      unzip
      p7zip
      busybox
      gh
      jq
      ripgrep
      nix-search-cli
      yq
      nerdfetch
      which
      glow
      ctop
      lsd
      timg
      bat
      fontconfig
      htop
    ];
  };
}
