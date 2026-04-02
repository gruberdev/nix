{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nixos-avf.nixosModules.avf
  ];

  avf.defaultUser = "${config.username}";
  system.stateVersion = "25.05";
}
