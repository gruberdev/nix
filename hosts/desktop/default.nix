{
  config,
  inputs,
  lib,
  pkgs,
  system,
  ...
}: {
  imports =
    [
      inputs.sops-nix.nixosModules.sops
      inputs.disko.nixosModules.disko
      ./disk.nix
      ../../modules/nixos/impermanence.nix
    ]
    ++ (lib.imports [
      "common/nix"
      "common/packages"
      "common/locale"
      ./nvidia.nix
      ./containers
      ../../modules/gaming/steam/desktop.nix
      ../../modules/common/fonts.nix
      ../../modules/networking/tailscale.nix
    ]);

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 15;
    };
    initrd.systemd = {
      enable = true;
    };
    kernelModules = ["ip_tables" "iptable_nat" "xt_nat" "xt_tcpudp" "xt_conntrack" "nf_conntrack" "nf_nat"];
    kernel.sysctl = {
      "vm.swappiness" = 60;
      "vm.vfs_cache_pressure" = 100;
      "vm.overcommit_memory" = 0;
      "vm.overcommit_ratio" = 50;
    };
  };

  networking = {
    networkmanager = {
      enable = true;
    };
    useDHCP = false;
    nftables.enable = true;
    enableIPv6 = true;
    extraHosts = ''
    '';
    interfaces = {
      eno1 = {
        useDHCP = true;
      };
    };
    firewall = {
      enable = true;
      trustedInterfaces = ["tailscale0"];
      allowedUDPPorts = [config.services.tailscale.port];
    };
    nameservers = ["1.1.1.1" "1.1.2.2"];
  };

  hardware.bluetooth.enable = true;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  security.sudo.wheelNeedsPassword = false;
  security.apparmor.enable = true;
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services = {
    displayManager.autoLogin = {
      enable = true;
      user = "${config.username}";
    };
    resolved = {
      enable = true;
      dnssec = "true";
      domains = ["~."];
      fallbackDns = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
      dnsovertls = "true";
    };
    xserver = {
      enable = true;
    };
    gvfs.enable = true;
  };

  sops = {
    secrets = {
      github = {
        key = "github";
      };
    };
    templates = {
      "nix.conf" = {
        content = ''
          access-tokens = github.com=${config.sops.placeholder.github}
        '';
        mode = "0440";
        owner = "root";
        group = "wheel";
      };
    };
  };

  environment.sessionVariables = {
    DSTASK_GIT_REPO = "~/.config/dstask";
  };

  environment.systemPackages = with pkgs; [
    kitty
    wget
    inputs.talhelper.packages.${system}.default
    inputs.iamb.packages.${system}.default
    inputs.tailscale.packages.${system}.default
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
    portaudio
  ];

  environment.etc = {
    "xdg/nix/nix.conf".source = config.sops.templates."nix.conf".path;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  programs = {
    virt-manager.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };
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
      "qemu-libvirtd"
      "syncthing"
    ];
    shell = pkgs.zsh;
  };
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  virtualisation.docker.daemon.settings.features.cdi = true;
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
      enableOnBoot = true;
      extraPackages = with pkgs; [
        docker-compose
        nvidia-container-toolkit
        nvidia-docker
      ];
      autoPrune = {
        enable = true;
        dates = "weekly";
      };

      daemon.settings = {
        data-root = "/persist/var/lib/docker";
        insecure-registries = [];
        storage-driver = "overlay2";
        runtimes = {
          nvidia = {
            path = "${pkgs.nvidia-container-toolkit}/bin/nvidia-container-runtime";
            runtimeArgs = [];
          };
        };
      };
    };
  };
  systemd.services.docker = {
    after = ["network.target"];
    wants = ["network.target"];
    path = with pkgs; [nvidia-container-toolkit];
  };
  system.stateVersion = "${config.version}";
}
