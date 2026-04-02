{pkgs, ...}: let
  clusterName = "1";

  registryName = "localhost";
  registryPort = 5001;

  k3dConfig = pkgs.writeText "k3d-config.yaml" ''
    apiVersion: k3d.io/v1alpha5
    kind: Simple
    metadata:
      name: "${clusterName}"
    servers: 1
    agents: 1
    kubeAPI:
      host: "localhost"
      hostIP: "0.0.0.0"
      hostPort: "6445"
    image: rancher/k3s:v1.33.0-k3s1
    network: one
    ports:
    - port: 8080:80
      nodeFilters:
      - loadbalancer
    - port: 4443:443
      nodeFilters:
      - loadbalancer
    registries:
      create:
        name: ${registryName}
        hostPort: "${toString registryPort}"
    options:
      k3d:
        wait: true
        timeout: "360s"
        loadbalancer:
          configOverrides:
          - settings.workerConnections=2048
      k3s:
        extraArgs:
        - arg: --disable=traefik
          nodeFilters:
          - server:*
        - arg: --tls-san=localhost,registry.local.gd,127.0.0.1,registry.localhost,k8s.localhost,whoami.k8s.localhost
          nodeFilters:
          - server:*
        - arg: --kubelet-arg=node-status-update-frequency=4s
          nodeFilters:
          - server:*
      kubeconfig:
        updateDefaultKubeconfig: true
        switchCurrentContext: true
  '';
in {
  environment.systemPackages = with pkgs; [
    k3d
    kubectl
  ];

  virtualisation.docker.enable = true;

  systemd.services.k3d-cluster = {
    description = "k3d cluster '${clusterName}'";
    wantedBy = ["multi-user.target"];
    after = ["docker.service"];
    requires = ["docker.service"];

    script = ''
      set -e
      if ${pkgs.k3d}/bin/k3d cluster get ${clusterName} >/dev/null 2>&1; then
        exit 0
      fi

      ${pkgs.k3d}/bin/k3d cluster delete ${clusterName} >/dev/null 2>&1 || true

      ${pkgs.k3d}/bin/k3d cluster create --config ${k3dConfig}
    '';

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStop = "${pkgs.k3d}/bin/k3d cluster delete ${clusterName}";
    };
  };
}
