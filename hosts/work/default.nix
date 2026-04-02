{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports =
    [
      inputs.sops-nix.nixosModules.sops
      ./disk.nix
      ../../modules/nixos/impermanence.nix
    ]
    ++ (lib.imports [
      "common/nix"
      "common/packages"
    ]);

  boot.initrd.kernelModules = ["amdgpu"];

  networking.hostName = "work";
  networking.wireless.iwd.enable = true;

  networking.networkmanager.enable = true;

  time.timeZone = "America/Sao_Paulo";

  hardware.bluetooth.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  services.xserver.xkb = {
    layout = "us";
    variant = "intl";
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services = {
    printing.enable = false;
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
    displayManager.autoLogin = {
      enable = true;
      user = "gruber";
    };
    xserver = {
      enable = true;
      videoDrivers = ["amdgpu"];
    };
    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
      authKeyFile = config.sops.secrets."tailscale/authfile".path;
      extraUpFlags = [
        "--accept-dns"
        "--accept-routes"
        "--ssh"
        "--reset"
        "--hostname"
        "${config.networking.hostName}"
      ];
    };
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  sops = {
    secrets = {
      "tailscale/authfile" = {
        key = "tailscale";
        owner = "root";
        mode = "0400"; # Read-only for owner.
      };
      github = {
        key = "github";
      };
    };
  };
  programs = {
    virt-manager.enable = true;
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
    };
    kdeconnect = {
      enable = true;
    };
  };
  users.users.${config.username} = {
    isNormalUser = true;
    extraGroups = [
      "libvirtd"
      "kvm"
      "audio"
      "video"
      "wheel"
      "networkmanager"
      "docker"
      "syncthing"
    ];
    shell = pkgs.zsh;
  };
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  systemd.services."NetworkManager-wait-online".enable = false;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kitty
    wget
    inputs.talhelper.packages.${system}.default
  ];
  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';
  virtualisation = {
    docker = {
      enable = true;
      enableOnBoot = true;
      extraPackages = with pkgs; [
        docker-compose
      ];
      autoPrune = {
        enable = true;
        dates = "weekly";
      };

      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
  system.stateVersion = "${config.version}";
}
