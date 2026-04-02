{
  config,
  pkgs,
  lib,
  ...
}: {
  services.xserver = {
    enable = true;
    videoDrivers = ["amdgpu"];
    xkb = {
      layout = "us";
      variant = "intl";
    };
  };

  hardware.bluetooth.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "gruber";
  };

  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };
}
