{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.impermanence.nixosModules.impermanence];

  boot.initrd.systemd = {
    enable = true;
    services.rollback = {
      description = "Rollback BTRFS rootfs to blank snapshot";
      wantedBy = [
        "initrd.target"
      ];
      after = [
        "systemd-cryptsetup@crypted.service"
      ];
      before = [
        "sysroot.mount"
      ];
      unitConfig.DefaultDependencies = "no";
      serviceConfig.Type = "oneshot";
      script = ''
        mkdir -p /btrfs_tmp
        mount /dev/mapper/crypted /btrfs_tmp
        if [[ -e /btrfs_tmp/@rootfs ]]; then
            mkdir -p /btrfs_tmp/old_roots
            timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/@rootfs)" "+%Y-%m-%-d_%H:%M:%S")
            mv /btrfs_tmp/@rootfs "/btrfs_tmp/old_roots/$timestamp"
        fi

        delete_subvolume_recursively() {
            IFS=$'\n'
            for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
                delete_subvolume_recursively "/btrfs_tmp/$i"
            done
            btrfs subvolume delete "$1"
        }

        for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
            delete_subvolume_recursively "$i"
        done

        btrfs subvolume create /btrfs_tmp/@rootfs
        umount /btrfs_tmp
      '';
    };
  };

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/nixos"
      "/var/lib/docker"
      "/etc/NetworkManager/system-connections"
    ];

    files = [
      "/etc/machine-id"
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];

    users.${config.username} = {
      directories = [
        "dotfiles"
        ".config"
        ".local"
        ".cache"
        ".krew"
        ".kube"
        ".bash_history"
        ".zplug"
        ".plugin"
        ".claude"
        ".zen"
        ".ssh"
        ".mozilla"
        ".steam"
      ];
      files = [
        ".zsh_history"
      ];
    };
  };

  systemd.tmpfiles.rules = [
    "d /persist 0755 root root -"
    "d /persist/home 0755 root root -"
    "d /persist/home/${config.username} 0755 ${config.username} users -"
    "d /persist/var/lib/docker 0755 root root -"
  ];
}
