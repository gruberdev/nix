{
  config,
  pkgs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [bc freerdp3];

  programs.virt-manager.enable = true;
  virtualisation = {
    libvirtd = {
      enable = true;
    };

    spiceUSBRedirection.enable = true;
  };

  users.groups.libvirt = {};

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      windows = {
        hostname = "winvm";
        autoStart = true;
        image = "dockurr/windows";
        volumes = [
          "${config.ssd1}/windows/shared:/shared"
          "${config.ssd1}/windows/storage:/storage"
          "${config.ssd1}/windows/oem:/oem"
        ];
        ports = ["8006:8006" "3389:3389"];
        environment = {
          VERSION = "win11e";
          USERNAME = "user";
          PASSWORD = "windows";
          DISK_SIZE = "128G";
          RAM_SIZE = "16G";
          CPU_CORES = "8";
        };
        extraOptions = ["--cap-add=NET_ADMIN" "--device=/dev/kvm" "--stop-timeout=120"];
      };
      windows-v2 = {
        hostname = "winvm-v2";
        autoStart = false;
        image = "dockurr/windows";
        volumes = [
          "${config.ssd1}/windows-v2/shared:/shared"
          "${config.ssd1}/windows-v2/data:/storage"
          "${config.ssd1}/windows-v2/oem:/oem"
        ];
        ports = ["8000:8006" "3333:3389"];
        environment = {
          VERSION = "win11e";
          USERNAME = "user";
          PASSWORD = "windows";
          DISK_SIZE = "128G";
          RAM_SIZE = "16G";
          CPU_CORES = "8";
        };
        extraOptions = ["--cap-add=NET_ADMIN" "--device=/dev/kvm" "--stop-timeout=120"];
      };
    };
  };
}
