{
  config,
  pkgs,
  ...
}: let
  talosBase = {
    memory = 1024;
    vcpus = 1;
    iso = pkgs.fetchurl {
      url = "https://github.com/siderolabs/talos/releases/download/v1.10.4/metal-amd64.iso";
      sha256 = "sha256-9uikSebTMytsjT2PX90YCDpaIS0ZrbOzJBOmSugpwQ0=";
    };
    network = {
      type = "bridge";
      bridge = "br0";
      gateway = "192.168.1.1";
    };
  };

  mergeVMConfig = base: overrides:
    base
    // overrides
    // {
      network = base.network // (overrides.network or {});
    };

  vms = {
    "k8s-controlplane-1" = mergeVMConfig talosBase {
      diskSize = 20;
      network = {
        mac = "52:54:00:00:00:01";
        ip = "192.168.1.101";
      };
    };

    "k8s-controlplane-2" = mergeVMConfig talosBase {
      diskSize = 20;
      network = {
        mac = "52:54:00:00:00:02";
        ip = "192.168.1.102";
      };
    };

    "k8s-controlplane-3" = mergeVMConfig talosBase {
      diskSize = 20;
      network = {
        mac = "52:54:00:00:00:03";
        ip = "192.168.1.103";
      };
    };

    "k8s-worker-1" = mergeVMConfig talosBase {
      diskSize = 10;
      network = {
        mac = "52:54:00:00:00:04";
        ip = "192.168.1.104";
      };
    };

    "k8s-worker-2" = mergeVMConfig talosBase {
      diskSize = 10;
      network = {
        mac = "52:54:00:00:00:05";
        ip = "192.168.1.105";
      };
    };

    "k8s-worker-3" = mergeVMConfig talosBase {
      diskSize = 10;
      network = {
        mac = "52:54:00:00:00:06";
        ip = "192.168.1.106";
      };
    };
  };
in {
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull];
        };
      };
      nss = {
        enable = true;
        enableGuest = true;
      };

      onBoot = "ignore";
      onShutdown = "shutdown";
      extraConfig = ''
        uri_default = "qemu:///system"
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    libvirt
    win-virtio
  ];

  environment.sessionVariables.LIBVIRT_DEFAULT_URI = ["qemu:///system"];
}
