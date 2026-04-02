{
  pkgs,
  lib,
  config,
  ...
}: {
  virtualisation.oci-containers.containers."WinApps" = {
    image = "ghcr.io/dockur/windows:latest";
    environment = {
      "CPU_CORES" = "4";
      "DISK_SIZE" = "64G";
      "HOME" = "${config.homePath}";
      "PASSWORD" = "windows";
      "RAM_SIZE" = "4G";
      "USERNAME" = "user";
      "VERSION" = "11";
    };
    volumes = [
      "${config.ssd1}/windows/shared:/shared"
      "${config.ssd1}/windows/oem:/oem:rw"
      "${config.ssd1}/windows/storage:/storage:rw"
    ];
    ports = [
      "8006:8006/tcp"
      "3389:3389/tcp"
      "3389:3389/udp"
    ];
    log-driver = "journald";
    autoStart = true;
    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--device=/dev/kvm:/dev/kvm:rwm"
      "--device=/dev/net/tun:/dev/net/tun:rwm"
      "--network-alias=windows"
      "--network=winapps_default"
    ];
  };

  systemd.services."docker-network-winapps_default" = {
    path = [pkgs.docker];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "docker network rm -f winapps_default";
    };
    script = ''
      docker network inspect winapps_default || docker network create winapps_default
    '';
    partOf = ["docker-compose-winapps-root.target"];
    wantedBy = ["docker-compose-winapps-root.target"];
  };

  systemd.services."docker-volume-winapps_data" = {
    path = [pkgs.docker];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
    };
    script = ''
      docker volume inspect winapps_data || docker volume create winapps_data
    '';
    partOf = ["docker-compose-winapps-root.target"];
    wantedBy = ["docker-compose-winapps-root.target"];
  };

  systemd.targets."docker-compose-winapps-root" = {
    unitConfig = {
    };
  };
}
