{
  inputs,
  config,
  ...
}: {
  programs.nixcord = {
    quickCss = ''
      body {
        --font: '${config.font}';
        --code-font: '${config.monospace}';
        font-weight: 300;
        letter-spacing: -0.05ch;
      }

      /* Dynamic color scheme using autoloaded theme */
      .theme-dark, .theme-light {
        --background-primary: ${config.theme.background};
        --background-secondary: ${config.theme.surface};
        --background-secondary-alt: ${config.theme.subtle};
        --background-tertiary: ${config.theme.overlay};
        --background-accent: ${config.theme.accent};
        --background-floating: ${config.theme.surface};
        --background-mobile-primary: ${config.theme.background};
        --background-mobile-secondary: ${config.theme.surface};
        --background-modifier-hover: ${config.theme.subtle};
        --background-modifier-active: ${config.theme.overlay};
        --background-modifier-selected: ${config.theme.accent}40;
        --background-modifier-accent: ${config.theme.accent}20;
        --text-normal: ${config.theme.foreground};
        --text-muted: ${config.theme.muted};
        --text-faint: ${config.theme.comment};
        --text-positive: ${config.theme.success};
        --text-warning: ${config.theme.warning};
        --text-danger: ${config.theme.error};
        --text-brand: ${config.theme.accent};
        --text-link: ${config.theme.cyan};
        --interactive-normal: ${config.theme.foreground-alt};
        --interactive-hover: ${config.theme.foreground};
        --interactive-active: ${config.theme.accent};
        --interactive-muted: ${config.theme.muted};
        --brand-experiment: ${config.theme.accent};
        --channels-default: ${config.theme.foreground-alt};
        --channeltextarea-background: ${config.theme.surface};
        --activity-card-background: ${config.theme.surface};
        --deprecated-panel-background: ${config.theme.background};
        --deprecated-card-bg: ${config.theme.surface};
        --deprecated-card-editable-bg: ${config.theme.subtle};
        --deprecated-store-bg: ${config.theme.background};
        --deprecated-quickswitcher-input-background: ${config.theme.surface};
        --deprecated-quickswitcher-input-placeholder: ${config.theme.muted};
        --deprecated-text-input-bg: ${config.theme.surface};
        --deprecated-text-input-border: ${config.theme.overlay};
        --deprecated-text-input-border-hover: ${config.theme.accent};
        --deprecated-text-input-border-disabled: ${config.theme.muted};
        --deprecated-text-input-prefix: ${config.theme.muted};
      }
    '';
    config = {
      useQuickCss = true;
      autoUpdate = false;
      notifyAboutUpdates = false;
      frameless = true;
      autoUpdateNotification = false;
      transparent = true;
      disableMinSize = true;
      themeLinks = [];
    };
    dorion = {
      theme = "dark";
      zoom = "0.8";
      blur = "acrylic";
    };
  };
}
