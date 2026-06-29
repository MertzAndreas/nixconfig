{ ... }: {
  programs.dank-material-shell = {
    enable = true;

    settings = {
        theme = "dark";
        dynamicTheming = true;
        currentThemeName = "dynamic";

        barConfigs = [{
            id = "default";
            enabled = true;
            visible = true;
            screenPreferences = [ "all" ];
            leftWidgets = [ "clock" "music" ];
            centerWidgets = [ "workspaceSwitcher" ];
            rightWidgets = [ "systemTray" "clipboard" "notificationButton" "battery" "controlCenterButton" ];
            transparency = 5;
            widgetTransparency = 50;
        }];
    };

    session = {
      isLightMode = false;
      wallpaperPath = "/home/mertz/dotfiles/theme/backgrounds/wallhaven-je8p85.jpg";
    };

    enableSystemMonitoring = true;     # System monitoring widgets (dgop)
    enableVPN = true;                  # VPN management widget
    enableDynamicTheming = true;       # Wallpaper-based theming (matugen)
    enableAudioWavelength = true;      # Audio visualizer (cava)
    enableCalendarEvents = true;       # Calendar integration (khal)
    enableClipboardPaste = true;

    niri = {
      enableKeybinds = true;
      enableSpawn = true;
      includes.enable = false;
    };
  };
}
