{
  inputs,
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.monero
  ];

  services.monero = {
    enable = true;
    rpc.address = "127.0.0.1";
    limits.upload = 128;
    extraConfig = ''
      out-peers=5
    '';
  };
}
