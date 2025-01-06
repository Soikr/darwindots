{
  services.aerospace = {
    enable = true;
    settings = {
      on-focus-changed = ["move-mouse window-lazy-center"];
      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer.left = 10;
        outer.bottom = 10;
        outer.top = 10;
        outer.right = 10;
      };
      exec = {
        inherit-env-vars = true;
        env-vars = {
          PATH = "/opt/homebrew/bin:/opt/homebrew/sbin:~/Applications/Home\ Manager\ Apps:\${PATH}";
        };
      };
      mode.main.binding = {
        alt-shift-enter = "exec-and-forget kitty.app";

        alt-quote = "layout tiles horizontal vertical";
        alt-backslash = "layout accordion horizontal vertical";
        alt-slash = "layout tiles accordion";
        alt-shift-space = "layout floating tiling";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-shift-left = "focus left";
        alt-shift-down = "focus down";
        alt-shift-up = "focus up";
        alt-shift-right = "focus right";

        alt-shift-h = ["move left" "focus left"];
        alt-shift-j = ["move down" "focus right"];
        alt-shift-k = ["move up" "focus up"];
        alt-shift-l = ["move right" "focus down"];
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
        alt-s = "workspace S";
        alt-g = "workspace G";
        alt-period = "workspace --wrap-around next";
        alt-comma = "workspace --wrap-around prev";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";
        alt-shift-6 = "workspace 6";
        alt-shift-7 = "workspace 7";
        alt-shift-8 = "workspace 8";
        alt-shift-9 = "workspace 9";
        alt-shift-s = "workspace S";
        alt-shift-g = "workspace G";
        alt-shift-period = ["move-node-to-workspace --wrap-around next" "workspace --wrap-around next"];
        alt-shift-comma = ["move-node-to-workspace --wrap-around prev" "workspace --wrap-around prev"];

        alt-tab = "workspace-back-and-forth";
        cmd-alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

        alt-shift-semicolon = [
          "mode service"
        ];

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
            app-id = "org.mozilla.com.zen.browser";
            window-title-regex-substring = "picture-in-picture";
          };
          run = ["layout floating"];
        }
        {
          "if".app-id = "com.roblox.RobloxPlayer";
          run = ["move-node-to-workspace G"];
        }
        {
          "if".app-id = "com.hnc.Discord";
          run = ["move-node-to-workspace S"];
        }
      ];
    };
  };
}
