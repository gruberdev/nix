{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.waybar = {
    enable = true;

    style = ''
      * {
        font-family: "${config.font}";
        font-size: 10pt;
        min-height: 10px;
        font-weight: bold;
        border-radius: 8px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        margin-left: 10px;
        margin-right: 10px;
        margin-top: 6px;
        background-color: ${config.theme.surface};
        padding: 3px;
        padding-left:8px;
        border: 2px none ${config.theme.foreground};
      }
      tooltip {
        background: ${config.theme.subtle};
      }
      tooltip label {
        color: ${config.theme.foreground};
      }
      #workspaces {
        background-color: ${config.theme.surface};
      }
      #workspaces button {
        color: ${config.theme.muted};
      }
      #workspaces button.active {
        color: ${config.theme.accent};
      }
      #clock {
        color: ${config.theme.foreground};
      }
      #pulseaudio {
        color: ${config.theme.accent-alt};
      }
      #network {
        color: ${config.theme.info};
      }
      #network.disconnected {
        color: ${config.theme.foreground};
      }
      #custom-icon {
        color: ${config.theme.foreground};
      }
      #custom-dstask {
        color: ${config.theme.foreground};
      }
      #custom-dstask.critical {
        color: ${config.theme.error};
      }
      #custom-dstask.high {
        color: ${config.theme.warning};
      }
      #custom-dstask.normal {
        color: ${config.theme.accent};
      }
      #custom-dstask.low {
        color: ${config.theme.muted};
      }
      #custom-dstask.empty {
        color: ${config.theme.subtle};
      }
      #clock, #pulseaudio, #bluetooth, #network, #custom-icon, #custom-dstask{
        padding-left: 10px;
        padding-right: 10px;
      }
    '';
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "custom/dstask"
          "pulseaudio"
          "network"
          "custom/icon"
        ];
        "hyprland/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "sort-by-number" = true;
          "disable-scroll" = true;
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M  %A %b %d}";
          "tooltip" = true;
          "tooltip-format" = "{:%A; %d %B %Y}\n<tt>{calendar}</tt>";
        };

        "pulseaudio" = {
          "format" = "{icon}";
          "format-muted" = "{format_source}";
          "format-bluetooth" = "{icon}";
          "format-bluetooth-muted" = "{format_source}";
          "format-source" = " ";
          "format-icons" = {
            "default" = [" " " " " "];
          };
          "on-click" = "pavucontrol";
          "on-click-right" = "pamixer -t";
          "tooltip" = false;
        };

        "network" = {
          "format-disconnected" = "󰯡 ";
          "format-ethernet" = "󰈀 ";
          "format-linked" = "󰖪 ";
          "format-wifi" = "󰖩 ";
          "interval" = 1;
          "on-click" = "nm-connection-editor";
          "tooltip" = false;
        };
        "custom/dstask" = {
          "format" = "{}";
          "return-type" = "json";
          "exec" = "~/.config/waybar/dstask-waybar.sh";
          "interval" = 30;
          "on-click" = "dstask show";
          "on-click-right" = "dstask next";
          "tooltip" = true;
        };
        "custom/icon" = {
          "format" = " ";
          "on-click" = "exec wallpaper_default";
          "on-click-right" = "exec wallpaper_random";
          "tooltip" = false;
        };
      }
    ];
  };
}
