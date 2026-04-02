{
  config,
  pkgs,
  ...
}: {
  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      localai = {
        image = "quay.io/go-skynet/local-ai:sha-39ab804-gpu-nvidia-cuda-12";
        autoStart = true;

        extraOptions = [
          "--gpus=all"
          "--name=localai"
        ];

        ports = ["8080:8080"];

        volumes = ["/var/lib/local-ai/models:/models"];

        environment = {
          DEBUG = "true";
          REBUILD = "true";
          BUILD_TYPE = "cublas";
          NVIDIA_VISIBLE_DEVICES = "all";
          PARALLEL_REQUEST = "true";
          LOCALAI_FORCE_META_BACKEND_CAPABILIY = "nvidia";
        };
      };
    };
  };
}
