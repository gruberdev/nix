{
  pkgs,
  inputs,
  config,
  ...
}: {
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "loginctl terminate-user $USER";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];

    style = ''

      * {
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: ${config.theme.background-alpha};
      }

      button {
        font-size: 32px;
        background-size: 25%;
        padding-bottom: 185px;
        margin: 10px;
        border-radius: 12px;
        background-color: ${config.theme.surface};
        border: 2px solid ${config.theme.accent};
        color: ${config.theme.foreground};
      }

      button:focus, button:active, button:hover {
        background-color: ${config.theme.accent};
        outline-style: none;
      }
    '';
  };
}
