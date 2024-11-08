{...}: {
  programs = {
    git = {
      enable = true;
      userName = "Soikr";
      userEmail = "Soikr@proton.me";
      signing = {
        key = null;
        signByDefault = true;
      };
      aliases = {
        cm = "commit";
        co = "checkout";

        di = "diff";
        dh = "diff HEAD";

        pu = "pull";
        ps = "push";

        fe = "fetch";
      };
      ignores = [
        # IDE
        ".idea"
        ".vs"
        ".vsc"
        ".vscode"
        # NPM
        "node_modules"
        "npm-debug.log"
        # Python
        "__pycache__"
        "*.pyc"
        ".DS_Store" # Mac
      ];

      delta = {
        enable = true;
        options = {
          features = "decorations";
        };
      };
    };

    gh = {
      enable = true;
      settings.git_protocol = "ssh";
    };

    ssh = {
      enable = true;
      addKeysToAgent = "confirm";

      matchBlocks = {
        "github.com" = {
          identityFile = "~/.ssh/github";
          extraOptions = {
            AddKeysToAgent = "yes";
            UseKeychain = "yes";
          };
        };
      };
    };
  };
}
