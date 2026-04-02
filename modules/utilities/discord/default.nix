{inputs, ...}: {
  imports = [
    ./theme.nix
    ./plugins.nix
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    vesktop.enable = true;
    dorion.enable = true;
    config = {
      useQuickCss = true;
      frameless = true;
    };
    extraConfig = {
    };
  };

  xdg.desktopEntries."discord" = {
    name = "Discord";
    comment = "All-in-one voice and text chat for gamers";
    genericName = "Internet Messenger";
    exec = "vesktop --force-device-scale-factor=1.5 --high-dpi-support=1 --force-color-profile=srgb %U";
    icon = "discord";
    terminal = false;
    categories = ["Network" "InstantMessaging"];
    mimeType = ["x-scheme-handler/discord"];
  };
}
