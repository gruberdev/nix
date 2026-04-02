_: let
  rootSubvolume = "rootfs";
in {
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = "/dev/nvme1n1";
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
            root = {
              size = "100%";
              content = let
                defaultOptions = [
                  "noatime"
                  "nodev"
                  "nosuid"
                  "discard"
                ];
              in {
                type = "btrfs";
                extraArgs = [
                  "-L"
                  "nixos"
                  "-f"
                ];
                postCreateHook = ''
                  MNTPOINT="$(mktemp -d)"
                  SRCMNT='/dev/disk/by-label/nixos'

                  mount -t btrfs -o 'compress=zstd,noexec,noatime,nodev,nosuid,discard' "$SRCMNT" "$MNTPOINT"
                  trap 'umount $MNTPOINT; rmdir $MNTPOINT' EXIT

                  btrfs subvolume snapshot -r "$MNTPOINT"/@${rootSubvolume} "$MNTPOINT"/@${rootSubvolume}-blank
                '';
                subvolumes = {
                  "@${rootSubvolume}" = {
                    mountpoint = "/";
                    mountOptions =
                      [
                        "compress=zstd"
                        "noexec"
                      ]
                      ++ defaultOptions;
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = ["compress=zstd"] ++ defaultOptions;
                  };
                  "@persist" = {
                    mountpoint = "/persist";
                    mountOptions =
                      [
                        "compress=no"
                        "noexec"
                      ]
                      ++ defaultOptions;
                  };
                  "@persist/home" = {
                    mountpoint = "/persist/home";
                    mountOptions = ["compress=no"] ++ defaultOptions;
                  };
                  "@persist/docker" = {
                    mountpoint = "/persist/var/lib/docker";
                    mountOptions = ["compress=no"] ++ defaultOptions;
                  };
                  "@var/log" = {
                    mountpoint = "/var/log";
                    mountOptions =
                      [
                        "compress=zstd"
                        "noexec"
                      ]
                      ++ defaultOptions;
                  };
                  "@swap" = {
                    mountpoint = "/.swap";
                    swap.swapfile.size = "60G";
                  };
                  "@tmp" = {
                    mountpoint = "/tmp";
                    mountOptions = ["compress=zstd"] ++ defaultOptions;
                  };
                };
              };
            };
          };
        };
      };
    };
  };
  fileSystems = {
    "/persist".neededForBoot = true;
    "/var/log".neededForBoot = true;
    "/.swap".neededForBoot = true;
    "/tmp".neededForBoot = true;
  };
}
