{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    qemu
    virt-manager
    bison
    bridge-utils
    tigervnc
    dnsmasq
    flex
    OVMF
    gvfs
    virt-viewer
    libvirt
    nftables
    xorg.xhost

    libusbmuxd
    socat
    usbmuxd
  ];

  boot = {
    extraModprobeConfig = ''
      options kvm_amd nested=1
      options kvm ignore_msrs=1 report_ignored_msrs=0
      options hid_apple fnmode=2
    '';
  };

  virtualisation.oci-containers = let
    resolvConf = pkgs.writeText "resolv.conf" ''
      nameserver 1.1.1.1
      nameserver 1.0.0.1
    '';
  in {
    backend = "docker";
    containers = {
      bluebubbles = {
        image = "sickcodes/docker-osx:latest";
        autoStart = true;
        extraOptions = [
          "--device=/dev/kvm"
          "--dns=1.1.1.1"
        ];
        ports = [
          "5999:5999"
          "1234:1234"
          "50922:10022"
        ];
        volumes = [
          "/tmp/.X11-unix:/tmp/.X11-unix"
          "${config.ssd2}/macos/maindisk.qcow2:/image"
          "${config.ssd2}/macos/bootdisk.qcow2:/bootdisk"
        ];
        environment = {
          IMAGE_PATH = "/image";
          BOOTDISK = "/bootdisk";
          EXTRA = "-display none -vnc 0.0.0.0:99,password-secret=secvnc0 -object secret,id=secvnc0,data=vnc";
          ADDITIONAL_PORTS = "hostfwd=tcp::1234-:1234,";
          DISPLAY = ":99";
          WIDTH = "1920";
          HEIGHT = "1080";
          NOPICKER = "true";
          SHORTNAME = "ventura";
        };
      };
    };
  };
}
