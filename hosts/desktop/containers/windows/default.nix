{
  config,
  pkgs,
  inputs,
  ...
}: let
  toggle-windows = pkgs.writeShellScriptBin "toggle-windows" ''
    if systemctl is-active --quiet docker-WinApps.service; then
      systemctl stop docker-WinApps.service
      if [ $? -ne 0 ]; then
        notify-send "Error" "Failed to turn Windows off."
      else
          notify-send "Success" "Windows off"
      fi
    else
      systemctl start docker-WinApps.service
      if [ $? -ne 0 ]; then
        notify-send "Error" "Failed to turn Windows on."
      else
          notify-send "Success" "Windows on"
      fi
    fi
  '';
in {
  imports = [
    ./windows.nix
  ];

  environment.systemPackages = [
    inputs.winapps.packages.${pkgs.system}.winapps
    inputs.winapps.packages.${pkgs.system}.winapps-launcher
  ];
}
