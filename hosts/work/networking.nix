{
  config,
  lib,
  pkgs,
  ...
}: {
  networking = {
    hostName = "work";
    useDHCP = false;

    interfaces = {
      wlan0 = {
        ipv4.addresses = [
          {
            address = "192.168.30.74";
            prefixLength = 24;
          }
        ];

        ipv6.addresses = [
          {
            address = "2001:db8:abcd::74";
            prefixLength = 64;
          }
        ];
      };
    };

    nameservers = [
      "1.1.1.1"
      "2606:4700:4700::64"
    ];

    interfaces.wlan0.ipv6.acceptRA = false;

    defaultGateway = {
      address = "192.168.30.1";
      interface = "wlan0";
    };

    defaultGateway6 = {
      address = "2001:db8:abcd::1";
      interface = "wlan0";
    };

    extraRoutes = [
      {
        address = "64:ff9b::";
        prefixLength = 96;
        via = "2001:db8:abcd::2";
        interface = "wlan0";
      }
    ];
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="28:d0:43:99:5a:19", NAME="eth0"
  '';

  wireless.iwd.enable = true;

  networkmanager.enable = true;

  boot.kernel.sysctl."net.ipv6.conf.wlan0.use_tempaddr" = 0;
}
