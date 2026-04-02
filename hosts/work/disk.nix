{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [../../modules/nixos/disk.nix];

  disko.devices.disk.main = {
    device = lib.mkForce "/dev/nvme0n1";
    content.partitions.luks.content.content.subvolumes."@swap".swap.swapfile.size = lib.mkForce "16G";
  };
}
