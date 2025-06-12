{
  lib,
  pkgs,
  ...
}: {
  services.aerospace = {
    enable = true;
    settings = {
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "${lib.getExe pkgs.sketchybar} --trigger delta-workspace focused=$AEROSPACE_FOCUSED_WORKSPACE previous=$AEROSPACE_PREV_WORKSPACE"
      ];

      on-focus-changed = ["move-mouse window-lazy-center"];
      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer.left = 10;
        outer.bottom = 10;
        outer.top = 40;
        outer.right = 10;
      };
      exec = {
        inherit-env-vars = true;
        env-vars = {
          PATH = "~/Applications:\${PATH}";
        };
      };
      mode.main.binding = {
        alt-shift-enter = "exec-and-forget kitty.app";

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
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-s = "workspace social";
        alt-g = "workspace gaming";
        alt-period = "workspace --wrap-around next";
        alt-comma = "workspace --wrap-around prev";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "move-node-to-workspace 6";
        alt-shift-7 = "move-node-to-workspace 7";
        alt-shift-8 = "move-node-to-workspace 8";
        alt-shift-9 = "move-node-to-workspace 9";
        alt-shift-s = "move-node-to-workspace social";
        alt-shift-g = "move-node-to-workspace gaming";
        alt-shift-left = ["move-node-to-workspace --wrap-around next" "workspace --wrap-around next"];
        alt-shift-right = ["move-node-to-workspace --wrap-around prev" "workspace --wrap-around prev"];

        alt-tab = "workspace-back-and-forth";

        alt-shift-semicolon = "mode service";

        cmd-h = [];
        cmd-alt-h = [];
      };
      mode.resize.binding = {
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
      mode.service.binding = {
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
          "if".app-id = "com.hnc.Discord";
          run = ["move-node-to-workspace social"];
        }
        {
          "if".app-id = "com.github.th-ch.youtube-music";
          run = ["move-node-to-workspace 9"];
        }
      ];
    };
  };
}
