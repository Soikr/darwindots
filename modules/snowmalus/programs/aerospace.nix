{
  lib,
  pkgs,
  ...
}: {
  services.aerospace = {
    enable = true;
    settings = {
      exec-on-workspace-change = let
        eowc = pkgs.writeShellScriptBin "eowc" ''
          ${lib.getExe pkgs.aerospace} list-windows --all | \
            awk '/Picture-in-Picture/ {print $1}' | \
            xargs -I _ ${lib.getExe pkgs.aerospace} move-node-to-workspace --window-id _ $AEROSPACE_FOCUSED_WORKSPACE

          ${lib.getExe pkgs.sketchybar} --trigger delta-workspace focused=$AEROSPACE_FOCUSED_WORKSPACE previous=$AEROSPACE_PREV_WORKSPACE
        '';
      in ["${eowc}/bin/eowc"];

      on-focus-changed = ["move-mouse window-lazy-center"];
      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer = {
          left = 10;
          bottom = 10;
          top = 42;
          right = 10;
        };
      };
      mode = {
        main.binding = {
          alt-quote = "layout tiles horizontal vertical";
          alt-backslash = "layout accordion horizontal vertical";
          alt-slash = "layout tiles accordion";
          alt-shift-space = "layout floating tiling";

          cmd-left = "focus left";
          cmd-down = "focus down";
          cmd-up = "focus up";
          cmd-right = "focus right";
          cmd-shift-left = ["move left" "focus left"];
          cmd-shift-down = ["move down" "focus down"];
          cmd-shift-up = ["move up" "focus up"];
          cmd-shift-right = ["move right" "focus right"];

          alt-m = "fullscreen";
          alt-shift-m = "macos-native-fullscreen";

          alt-r = ["mode resize"];

          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          alt-4 = "workspace music";
          alt-s = "workspace social";
          alt-backtick = "workspace gaming";
          alt-period = "workspace --wrap-around next";
          alt-comma = "workspace --wrap-around prev";

          alt-shift-1 = "move-node-to-workspace 1";
          alt-shift-2 = "move-node-to-workspace 2";
          alt-shift-3 = "move-node-to-workspace 3";
          alt-shift-4 = "move-node-to-workspace music";
          alt-shift-s = "move-node-to-workspace social";
          alt-shift-backtick = "move-node-to-workspace gaming";
          alt-shift-left = ["move-node-to-workspace --wrap-around prev" "workspace --wrap-around prev"];
          alt-shift-right = ["move-node-to-workspace --wrap-around next" "workspace --wrap-around next"];

          alt-tab = "workspace-back-and-forth";

          alt-shift-semicolon = "mode service";

          cmd-h = [];
          cmd-alt-h = [];
        };
        resize.binding = {
          h = "resize width -50";
          j = "resize height +50";
          k = "resize height -50";
          l = "resize width +50";
          left = "resize width -50";
          down = "resize height +50";
          up = "resize height -50";
          right = "resize width +50";
          enter = "mode main";
          esc = "mode main";
        };
        service.binding = {
          esc = [
            "exec-and-forget ${lib.getExe pkgs.sketchybar} --reload"
            "reload-config"
            "mode main"
          ];
          r = [
            "flatten-workspace-tree"
            "mode main"
          ];

          alt-shift-h = ["join-with left" "mode main"];
          alt-shift-j = ["join-with down" "mode main"];
          alt-shift-k = ["join-with up" "mode main"];
          alt-shift-l = ["join-with right" "mode main"];
        };
      };
      on-window-detected = [
        {
          "if".app-id = "com.apple.finder";
          run = ["layout floating"];
        }
        {
          "if" = {
            app-id = "app.zen-browser.zen";
            window-title-regex-substring = "picture-in-picture";
          };
          run = ["layout floating"];
        }
        {
          "if".app-id = "app.zen-browser.zen";
          run = ["move-node-to-workspace 1"];
        }
        {
          "if".app-id = "com.roblox.RobloxPlayer";
          run = ["move-node-to-workspace gaming"];
        }
        {
          "if".app-id = "org.Terraria";
          run = [
            "layout floating"
            "move-node-to-workspace gaming"
          ];
        }
        {
          "if".app-id = "com.StefMorojna.SpaceflightSimulator";
          run = ["move-node-to-workspace gaming"];
        }
        {
          "if" = {
            app-name-regex-substring = "java";
            window-title-regex-substring = "Minecraft";
          };
          run = ["move-node-to-workspace gaming"];
        }
        {
          "if".app-id = "dev.vencord.vesktop";
          run = ["move-node-to-workspace social"];
        }
        {
          "if".app-id = "com.github.th-ch.youtube-music";
          run = ["move-node-to-workspace music"];
        }
      ];
    };
  };

  system.defaults.dock.expose-group-apps = true;
}
