{
  pkgs,
  config,
  ...
}: let
  localPkgs = pkgs.callPackage ../../pkgs {};
in {
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;
    packages = with pkgs; [
      material-design-icons
      font-awesome
      noto-fonts
      noto-fonts-emoji
      font-awesome_5
      font-awesome_6
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.iosevka
      inter-nerdfont

      localPkgs.sf-pro-rounded
      localPkgs.monolisa
    ];

    fontconfig = {
      defaultFonts = {
        serif = [
          "${config.font}"
        ];
        sansSerif = [
          "${config.font}"
        ];
        monospace = [
          "MonoLisa"
          "DejaVu Sans Mono"
          "monospace"
        ];
        emoji = ["Noto Color Emoji"];
      };
      cache32Bit = true;
      hinting.enable = true;
      hinting.autohint = false;
      subpixel = {
        rgba = "rgb";
      };
    };
  };
}
