{
  config,
  ...
}: {
  config = {
    home.file.".config/iamb/config.toml".text = ''
      default_profile = "beeper"

      [profiles.beeper]
      user_id = "@grubeer:beeper.com"
      url = "https://matrix.beeper.com"

      [settings]
      default_room = ""
      external_edit_file_suffix = ".md"
      log_level = "warn"
      message_shortcode_display = false
      open_command = ["xdg-open"]
      reaction_display = true
      reaction_shortcode_display = false
      read_receipt_display = true
      read_receipt_send = false
      request_timeout = 10000
      typing_notice_display = true
      typing_notice_send = false
      user_gutter_width = 30
      username_display = "displayname"

      [settings.image_preview]
      protocol.type = "kitty"
      size = { "width" = 66, "height" = 10 }

      [settings.sort]
      rooms = ["recent", "unread", "lowpriority"]

      [settings.users]
      "@grubeer:beeper.com" = { "name" = "Gruber", "color" = "magenta" }

      [layout]
      style = "new"

      [[layout.tabs]]
      window = "iamb://dms"

      [[layout.tabs]]
      window = "iamb://rooms"

      [macros.insert]
      "jj" = "<Esc>"

      [settings.notifications]
      enabled = true

      [macros."normal|visual"]
      "V" = "<C-W>m"

      [dirs]
      cache = "${config.xdg.cacheHome}/iamb/"
      logs = "${config.xdg.dataHome}/iamb/logs/"
      downloads = "${config.home.homeDirectory}/Downloads/"
    '';
  };
}
