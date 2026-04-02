{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme0n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "2G";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = ["umask=0077"];
              };
            };
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                passwordFile = "/tmp/luks.key";
                settings = {
                  allowDiscards = true;
                  bypassWorkqueues = true;
                  crypttabExtraOpts = [
                    "tpm2-device=auto"
                    "tpm2-measure-pcr=yes"
                  ];
                };
                content = {
                  type = "btrfs";
                  extraArgs = ["-L" "nixos" "-f"];
                  postCreateHook = ''
                    MNTPOINT="$(mktemp -d)"
                    SRCMNT='/dev/mapper/crypted'

                    mount -t btrfs -o 'compress=zstd,noexec,noatime,nodev,nosuid,discard' "$SRCMNT" "$MNTPOINT"
                    trap 'umount $MNTPOINT; rmdir $MNTPOINT' EXIT

                    btrfs subvolume snapshot -r "$MNTPOINT"/@rootfs "$MNTPOINT"/@rootfs-blank
                  '';
                  subvolumes = {
                    "@rootfs" = {
                      mountpoint = "/";
                      mountOptions = ["compress=zstd" "noexec" "noatime" "nodev" "nosuid" "discard"];
                    };
                    "@nix" = {
                      mountpoint = "/nix";
                      mountOptions = ["compress=zstd" "noatime" "nodev" "nosuid" "discard"];
                    };
                    "@persist" = {
                      mountpoint = "/persist";
                      mountOptions = ["compress=no" "noexec" "noatime" "nodev" "nosuid" "discard"];
                    };
                    "@persist/home" = {
                      mountpoint = "/persist/home";
                      mountOptions = ["compress=no" "noatime" "nodev" "nosuid" "discard"];
                    };
                    "@persist/docker" = {
                      mountpoint = "/persist/var/lib/docker";
                      mountOptions = ["compress=no" "noatime" "nodev" "nosuid" "discard"];
                    };
                    "@var/log" = {
                      mountpoint = "/var/log";
                      mountOptions = ["compress=zstd" "noexec" "noatime" "nodev" "nosuid" "discard"];
                    };
                    "@swap" = {
                      mountpoint = "/.swap";
                      swap.swapfile.size = "60G";
                    };
                    "@tmp" = {
                      mountpoint = "/tmp";
                      mountOptions = ["compress=zstd" "noatime" "nodev" "nosuid" "discard"];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
