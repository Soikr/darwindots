{...}: {
  programs.git = {
    enable = true;
    userName = "SoiKr";
    userEmail = "Soikr@proton.me";
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
}
