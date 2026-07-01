{ lib, pkgs, ... }: {
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    settings = {

      cursor = {
        size = 28;
      };

      input = {
        keyboard = {
          xkb = {
            layout = "dk";
            variant = "nodeadkeys";
          };
          numlock = true;
        };
        touchpad = {
          tap = true;
          dwt = true;
          drag = true;
          "drag-lock" = true;
          "natural-scroll" = true;
          "scroll-factor" = 1.5;
        };
        mouse."accel-speed" = -0.75;
        "warp-mouse-to-focus".enable = true;
        "focus-follows-mouse"."max-scroll-amount" = "0%";

      };

      clipboard."disable-primary" = true;

      gestures."hot-corners".enable = false;

      outputs = {
        "HDMI-A-1" = {
          mode = {
            width = 2560;
            height = 1600;
            refresh = 120.0;
          };
          scale = 1.2;
          position = {
            x = 0;
            y = 0;
          };
        };
      };

      animations = {
        window-open = {
          kind.easing = {
            duration-ms = 200;
            curve = "linear";
          };
          custom-shader = ''
            vec4 expanding_circle(vec3 coords_geo, vec3 size_geo) {
              vec3 coords_tex = niri_geo_to_tex * coords_geo;
              vec4 color = texture2D(niri_tex, coords_tex.st);
              vec2 coords = (coords_geo.xy - vec2(0.5, 0.5)) * size_geo.xy * 2.0;
              coords = coords / length(size_geo.xy);
              float p = niri_clamped_progress;
              if (p * p <= dot(coords, coords))
                color = vec4(0.0);
              return color;
            }
            vec4 open_color(vec3 coords_geo, vec3 size_geo) {
              return expanding_circle(coords_geo, size_geo);
            }
          '';
        };

        window-close = {
          kind.easing = {
            duration-ms = 175;
            curve = "linear";
          };
          custom-shader = ''
            vec4 shrinking_circle(vec3 coords_geo, vec3 size_geo) {
              vec3 coords_tex = niri_geo_to_tex * coords_geo;
              vec4 color = texture2D(niri_tex, coords_tex.st);
              vec2 coords = (coords_geo.xy - vec2(0.5, 0.5)) * size_geo.xy * 2.0;
              coords = coords / length(size_geo.xy);
              float p_close = 1.0 - niri_clamped_progress;
              if (p_close * p_close <= dot(coords, coords))
                color = vec4(0.0);
              return color;
            }
            vec4 close_color(vec3 coords_geo, vec3 size_geo) {
              return shrinking_circle(coords_geo, size_geo);
            }
          '';
        };
      };

      layout = {
        gaps = 10;
        "focus-ring" = {
          enable = false;
        };
        "center-focused-column" = "never";
        "default-column-width" = {
          proportion = 0.5;
        };
        "preset-column-widths" = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];
        shadow = {
          enable = true;
          "draw-behind-window" = true;
          softness = 20;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#0007";
        };
      };

      "spawn-at-startup" = [
        { argv = [ "spotify" ]; }
        { argv = [ "vesktop" ]; }
        { argv = [ "nm-applet" ]; }
      ];

      "prefer-no-csd" = true;
      "screenshot-path" = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";
      "hotkey-overlay"."skip-at-startup" = true;

      "window-rules" = [
        {
          "geometry-corner-radius" = {
            "top-left" = 20.0;
            "top-right" = 20.0;
            "bottom-right" = 20.0;
            "bottom-left" = 20.0;
          };
          "clip-to-geometry" = true;
        }
        {
          matches = [ { "is-active" = false; } ];
          opacity = 0.85;
        }
        {
          matches = [ { "is-active" = true; } ];
          opacity = 0.90;
        }
        {
          matches = [
            { "app-id" = "^org\\.keepassxc\\.KeePassXC$"; }
            { "app-id" = "^org\\.gnome\\.World\\.Secrets$"; }
          ];
          "block-out-from" = "screen-capture";
        }
        {
          matches = [ { "app-id" = "pavucontrol$"; } ];
          "open-floating" = true;
          "default-floating-position" = {
            x = 4;
            y = 4;
            relative-to = "bottom-right";
          };
        }
      ];

      debug."honor-xdg-activation-with-invalid-serial" = true;

      binds = lib.mkForce {
        "Mod+Shift+M" = {
          action.spawn = [
            "wl-mirror"
            "eDP-1"
          ];
          repeat = false;
        };
        "Shift+Super+F23".action.spawn = [ "true" ];

        "Mod+Alt+K".action."show-hotkey-overlay" = [ ];
        "Mod+Shift+E".action.quit = [ ];
        "Mod+O".action."toggle-overview" = [ ];
        "Mod+Q".action."close-window" = [ ];
        "Mod+Tab".action."focus-workspace-previous" = [ ];
        "Mod+P".action.screenshot = { };
        "Mod+Shift+P".action."screenshot-screen" = { };
        "Mod+Alt+P".action."screenshot-window" = { };

        "Mod+Return" = {
          action.spawn = [
            "sh"
            "-c"
            "kitty-cwd"
          ];
          "hotkey-overlay".title = "Open a Terminal: kitty";
        };
        "Mod+Space".action.spawn = [
          "dms"
          "ipc"
          "call"
          "spotlight"
          "toggle"
        ];
        "Mod+N".action.spawn = [
          "dms"
          "ipc"
          "call"
          "notifications"
          "toggle"
        ];
        "Mod+S".action.spawn = [
          "dms"
          "ipc"
          "call"
          "settings"
          "toggle"
        ];
        "Super+Alt+L" = {
          "allow-when-locked" = true;
          action.spawn = [
            "dms"
            "ipc"
            "call"
            "lock"
            "lock"
          ];
        };
        "Mod+X".action.spawn = [
          "dms"
          "ipc"
          "call"
          "powermenu"
          "toggle"
        ];
        "Mod+V".action.spawn = [
          "dms"
          "ipc"
          "call"
          "clipboard"
          "toggle"
        ];
        "Mod+Alt+N" = {
          "allow-when-locked" = true;
          action.spawn = [
            "dms"
            "ipc"
            "call"
            "night"
            "toggle"
          ];
        };
        "XF86AudioRaiseVolume" = {
          "allow-when-locked" = true;
          action.spawn = [
            "dms"
            "ipc"
            "call"
            "audio"
            "increment"
            "3"
          ];
        };
        "XF86AudioLowerVolume" = {
          "allow-when-locked" = true;
          action.spawn = [
            "dms"
            "ipc"
            "call"
            "audio"
            "decrement"
            "3"
          ];
        };
        "XF86AudioMute" = {
          "allow-when-locked" = true;
          action.spawn = [
            "dms"
            "ipc"
            "call"
            "audio"
            "mute"
          ];
        };
        "XF86AudioMicMute" = {
          "allow-when-locked" = true;
          action.spawn = [
            "dms"
            "ipc"
            "call"
            "audio"
            "micmute"
          ];
        };
        "XF86MonBrightnessUp" = {
          "allow-when-locked" = true;
          action.spawn = [
            "dms"
            "ipc"
            "call"
            "brightness"
            "increment"
            "5"
            ""
          ];
        };
        "XF86MonBrightnessDown" = {
          "allow-when-locked" = true;
          action.spawn = [
            "dms"
            "ipc"
            "call"
            "brightness"
            "decrement"
            "5"
            ""
          ];
        };

        "XF86AudioPlay" = {
          "allow-when-locked" = true;

          action.spawn = [
            "dms"
            "ipc"
            "call"
            "mpris"
            "playPause"
          ];
        };

        "XF86AudioPause" = {
          "allow-when-locked" = true;

          action.spawn = [
            "dms"
            "ipc"
            "call"
            "mpris"
            "pause"
          ];
        };

        "XF86AudioStop" = {
          "allow-when-locked" = true;

          action.spawn = [
            "dms"
            "ipc"
            "call"
            "mpris"
            "stop"
          ];
        };

        "XF86AudioNext" = {
          "allow-when-locked" = true;

          action.spawn = [
            "dms"
            "ipc"
            "call"
            "mpris"
            "next"
          ];
        };

        "XF86AudioPrev" = {
          "allow-when-locked" = true;

          action.spawn = [
            "dms"
            "ipc"
            "call"
            "mpris"
            "previous"
          ];
        };

        "Mod+B" = {
          action.spawn = [
            "sh"
            "-c"
            "firefox"
          ];
          "hotkey-overlay".title = "Open Browser: Firefox";
        };
        "Mod+D" = {
          action.spawn = [ "vesktop" ];
          "hotkey-overlay".title = "Open Vesktop";
        };
        "Mod+M" = {
          action.spawn = [
            "sh"
            "-c"
            "run-or-raise Spotify spotify"
          ];
          "hotkey-overlay".title = "Open Spotify";
        };
        "Mod+E" = {
          action.spawn = [
            "nautilus"
            "--new-window"
          ];
          "hotkey-overlay".title = "File manager: Nautilus";
        };

        "Mod+Left".action."focus-column-left" = [ ];
        "Mod+Down".action."focus-window-down" = [ ];
        "Mod+Up".action."focus-window-up" = [ ];
        "Mod+Right".action."focus-column-right" = [ ];
        "Mod+H".action."focus-column-left" = [ ];
        "Mod+J".action."focus-window-down" = [ ];
        "Mod+K".action."focus-window-up" = [ ];
        "Mod+L".action."focus-column-right" = [ ];

        "Mod+Shift+Left".action."move-column-left" = [ ];
        "Mod+Shift+Down".action."move-window-down" = [ ];
        "Mod+Shift+Up".action."move-window-up" = [ ];
        "Mod+Shift+Right".action."move-column-right" = [ ];
        "Mod+Shift+H".action."move-column-left" = [ ];
        "Mod+Shift+J".action."move-window-down" = [ ];
        "Mod+Shift+K".action."move-window-up" = [ ];
        "Mod+Shift+L".action."move-column-right" = [ ];

        "Mod+Alt+Down".action."focus-monitor-down" = [ ];
        "Mod+Alt+Up".action."focus-monitor-up" = [ ];

        "Mod+Home".action."focus-column-first" = [ ];
        "Mod+End".action."focus-column-last" = [ ];
        "Mod+Ctrl+Home".action."move-column-to-first" = [ ];
        "Mod+Ctrl+End".action."move-column-to-last" = [ ];

        "Mod+WheelScrollDown" = {
          action."focus-workspace-down" = [ ];
          "cooldown-ms" = 150;
        };
        "Mod+WheelScrollUp" = {
          action."focus-workspace-up" = [ ];
          "cooldown-ms" = 150;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          action."move-column-to-workspace-down" = [ ];
          "cooldown-ms" = 150;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          action."move-column-to-workspace-up" = [ ];
          "cooldown-ms" = 150;
        };
        "Mod+WheelScrollRight".action."focus-column-right" = [ ];
        "Mod+WheelScrollLeft".action."focus-column-left" = [ ];
        "Mod+Ctrl+WheelScrollRight".action."move-column-right" = [ ];
        "Mod+Ctrl+WheelScrollLeft".action."move-column-left" = [ ];
        "Mod+Shift+WheelScrollDown".action."focus-column-right" = [ ];
        "Mod+Shift+WheelScrollUp".action."focus-column-left" = [ ];
        "Mod+Ctrl+Shift+WheelScrollDown".action."move-column-right" = [ ];
        "Mod+Ctrl+Shift+WheelScrollUp".action."move-column-left" = [ ];

        "Mod+Page_Down".action."focus-workspace-down" = [ ];
        "Mod+Page_Up".action."focus-workspace-up" = [ ];
        "Mod+U".action."focus-workspace-down" = [ ];
        "Mod+I".action."focus-workspace-up" = [ ];
        "Mod+Ctrl+Page_Down".action."move-column-to-workspace-down" = [ ];
        "Mod+Ctrl+Page_Up".action."move-column-to-workspace-up" = [ ];
        "Mod+Ctrl+U".action."move-column-to-workspace-down" = [ ];
        "Mod+Ctrl+I".action."move-column-to-workspace-up" = [ ];
        "Mod+Shift+Page_Down".action."move-workspace-down" = [ ];
        "Mod+Shift+Page_Up".action."move-workspace-up" = [ ];
        "Mod+Shift+U".action."move-workspace-down" = [ ];
        "Mod+Shift+I".action."move-workspace-up" = [ ];

        "Mod+1".action."focus-workspace" = [ 1 ];
        "Mod+2".action."focus-workspace" = [ 2 ];
        "Mod+3".action."focus-workspace" = [ 3 ];
        "Mod+4".action."focus-workspace" = [ 4 ];
        "Mod+5".action."focus-workspace" = [ 5 ];
        "Mod+6".action."focus-workspace" = [ 6 ];
        "Mod+7".action."focus-workspace" = [ 7 ];
        "Mod+8".action."focus-workspace" = [ 8 ];
        "Mod+9".action."focus-workspace" = [ 9 ];
        "Mod+Shift+1".action."move-column-to-workspace" = [ 1 ];
        "Mod+Shift+2".action."move-column-to-workspace" = [ 2 ];
        "Mod+Shift+3".action."move-column-to-workspace" = [ 3 ];
        "Mod+Shift+4".action."move-column-to-workspace" = [ 4 ];
        "Mod+Shift+5".action."move-column-to-workspace" = [ 5 ];
        "Mod+Shift+6".action."move-column-to-workspace" = [ 6 ];
        "Mod+Shift+7".action."move-column-to-workspace" = [ 7 ];
        "Mod+Shift+8".action."move-column-to-workspace" = [ 8 ];
        "Mod+Shift+9".action."move-column-to-workspace" = [ 9 ];

        "Mod+Comma".action."consume-window-into-column" = [ ];
        "Mod+Period".action."expel-window-from-column" = [ ];
        "Mod+Shift+Comma".action."consume-or-expel-window-left" = [ ];
        "Mod+Shift+Period".action."consume-or-expel-window-right" = [ ];

        "Mod+R".action."switch-preset-column-width" = [ ];
        "Mod+Shift+R".action."switch-preset-column-width-back" = [ ];
        "Mod+F".action."maximize-column" = [ ];
        "Mod+Shift+F".action."fullscreen-window" = [ ];
        "Mod+Minus".action."set-column-width" = [ "-10%" ];
        "Mod+Plus".action."set-column-width" = [ "+10%" ];

        "Mod+Shift+V".action."toggle-window-floating" = [ ];
        "Mod+Ctrl+V".action."switch-focus-between-floating-and-tiling" = [ ];

        "Mod+Escape" = {
          action."toggle-keyboard-shortcuts-inhibit" = [ ];
          "allow-inhibiting" = false;
        };
      };
    };
  };
}
