{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports =
    [
      inputs.nixos-wsl.nixosModules.default
      inputs.sops-nix.nixosModules.sops
    ]
    ++ (lib.imports [
      "common/nix"
      "common/packages"
    ]);

  system.stateVersion = "${config.version}";
  nixpkgs.hostPlatform = "x86_64-linux";
  programs.dconf.enable = true;
  environment = {
    systemPackages = with pkgs; [
      wsl-open
      wslu
      pinentry-tty
    ];
    variables = {
      DONT_PROMPT_WSL_INSTALL = "true";
    };
  };

  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
  fileSystems."/tmp/.X11-unix/X0" = {
    device = "${config.wsl.wslConf.automount.root}/wslg/.X11-unix/X0";
    options = ["bind"];
  };

  sops.secrets.tailscale_authfile = {
    key = "tailscale";
    owner = "root";
    mode = "0400";
  };

  services = {
    tailscale = {
      enable = true;
      authKeyFile = "/run/secrets/tailscale_authfile";
      extraUpFlags = [
        "--accept-dns"
        "--accept-routes"
        "--ssh"
        "--reset"
      ];
    };
    openssh = {
      enable = true;
      ports = [22];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password";
      };
    };
  };

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      sudo = "/run/wrappers/bin/sudo";
    };
  };

  users = {
    users.${config.username} = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "docker"
        "networkmanager"
      ];
    };
    defaultUserShell = pkgs.zsh;
  };

  networking.firewall = {
    enable = true;
    trustedInterfaces = ["tailscale0"];
    allowedUDPPorts = [config.services.tailscale.port];
  };

  wsl = {
    enable = true;
    defaultUser = "gruber";
    docker-desktop.enable = true;
    startMenuLaunchers = true;
    useWindowsDriver = true;
    wslConf = {
      network = {
        generateResolvConf = true;
        hostname = "wsl";
      };
    };
  };
}
