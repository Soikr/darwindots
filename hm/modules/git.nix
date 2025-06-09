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
        si = "switch";

        di = "diff";
        dh = "diff HEAD";

        pu = "pull";
        ps = "push";

        fe = "fetch";

        ri = "rebase -i";
        rc = "rebase --continue";
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
  };
}
