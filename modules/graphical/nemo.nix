{pkgs, ...}: {
  home.packages = with pkgs; [
    nemo-with-extensions
    sushi
    evince
    nemo-emblems
    folder-color-switcher
    nemo-preview
    file-roller
    imagemagick
    ffmpegthumbnailer
    glib
  ];
  home.sessionVariables = {
    GTK_FILE_CHOOSER = "nemo";
  };
  xdg.desktopEntries.nemo = {
    name = "Nemo";
    genericName = "File Manager";
    categories = ["Application"];
    terminal = false;
    exec = "${pkgs.nemo-with-extensions}/bin/nemo";
  };
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["nemo.desktop"];
      "application/x-gnome-saved-search" = ["nemo.desktop"];
    };
  };
  dconf.settings = {
    "org/nemo/preferences" = {
      show-hidden-files = true;
      default-folder-viewer = "list-view";
      sort-directories-first = false;
      default-sort-order = "mtime";
      show-advanced-permissions = true;
      confirm-trash = false;
      enable-delete = true;
      thumbnail-limit = 10485760;
      click-double-parent-folder = true;
      show-full-path-titles = false;
      last-server-connect-method = 3;
      quick-renames-with-pause-in-between = true;
      always-use-browser = true;
      close-device-view-on-device-eject = true;
      date-format = "iso";
    };
    "org/nemo/preferences/menu-config" = {
      background-menu-open-as-root = false;
      selection-menu-open-as-root = false;
      selection-menu-open-in-terminal = false;
      selection-menu-scripts = false;
    };
    "org/nemo/search" = {
      search-reverse-sort = true;
      search-sort-column = "mtime";
      search-files-recursively = true;
    };
    "org/nemo/window-state" = {
      maximized = false;
      network-expanded = true;
      sidebar-width = 220;
      side-pane-view = "tree";
      start-with-menu-bar = false;
      start-with-sidebar = true;
      start-with-status-bar = false;
      start-with-toolbar = true;
    };
    "org/cinnamon/desktop/applications/terminal" = {
      exec = "ghostty";
    };
    "org/gnome/desktop/default-applications/file-manager" = {
      exec = "nemo";
      exec-arg = "";
    };
  };
}
