{
  config,
  pkgs,
  lib,
  ...
}: let
  volumeName = "cognee-mcp-data";
  imageName = "cognee-mcp-image:latest";
  containerName = "cognee-mcp";
  serviceName = "cognee-mcp";
in {
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  systemd.services."docker-volume-${volumeName}" = {
    description = "Create Docker volume for Cognee MCP";
    requires = ["docker.service"];
    after = ["docker.service"];
    serviceConfig.Type = "oneshot";
    script = ''
      if ! ${pkgs.docker}/bin/docker volume inspect ${volumeName} &>/dev/null; then
        ${pkgs.docker}/bin/docker volume create ${volumeName}
      fi
    '';
    path = [pkgs.docker];
    unitConfig.ConditionPathExists = "!${config.virtualisation.docker.storagePath}/volumes/${volumeName}/";
    wantedBy = ["multi-user.target"];
  };

  systemd.services.${serviceName} = {
    description = "Cognee MCP Service with Persistent Storage";
    requires = ["docker.service" "docker-volume-${volumeName}.service"];
    after = ["docker.service" "docker-volume-${volumeName}.service" "network.target"];

    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.docker}/bin/docker run --rm \
        --name ${containerName} \
        -v ${volumeName}:/app/data \
        ${imageName}";
      ExecStop = "${pkgs.docker}/bin/docker stop -t 10 ${containerName}";
      ExecStopPost = "${pkgs.docker}/bin/docker rm -f ${containerName} || true";
      Restart = "on-failure";
      RestartSec = "30s";
    };

    environment = {
      COGNEE_STORAGE_TYPE = "volume";
      COGNEE_DATA_DIR = "/app/data";
    };

    wantedBy = ["multi-user.target"];
  };

  systemd.services."${serviceName}-upgrade" = {
    description = "Update Cognee MCP Docker image";
    serviceConfig.Type = "oneshot";
    script = ''
      ${pkgs.docker}/bin/docker pull ${imageName}
      systemctl restart ${serviceName}
    '';
    startAt = "weekly";
  };
}
