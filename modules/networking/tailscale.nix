{
  config,
  inputs,
  lib,
  pkgs,
  system,
  nixgl,
  ...
}: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops = {
    secrets = {
      "tailscale/authfile" = {
        key = "tailscale";
        owner = "root";
        mode = "0400";
      };
      "tailscalework/authfile" = {
        key = "tailscale";
        owner = "root";
        mode = "0400";
      };
    };
  };

  services = {
    openssh = {
      enable = false;
      ports = [22];
      settings = {
        PasswordAuthentication = true;
        AllowUsers = null;
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password";
      };
    };
    tailscale = {
      enable = true;
      package = inputs.tailscale.packages.${system}.tailscale;
      useRoutingFeatures = "both";
      authKeyFile = config.sops.secrets."tailscale/authfile".path;
      extraUpFlags = [
        "--accept-routes"
        "--accept-dns"
        "--reset"
        "--hostname"
        "${config.networking.hostName}"
      ];
    };
  };
}
