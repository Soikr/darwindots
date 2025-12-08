{config, ...}: {
  programs = {
    git = {
      enable = true;
      signing = {
        key = "${config.home.homeDirectory}/.ssh/git.pub";
        signByDefault = true;
      };
      ignores = [
        ".DS_Store"
        "result"
      ];
      settings = {
        user = {
          name = "Soikr";
          email = "Soikr@proton.me";
        };
        alias = {
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
        init.defaultBranch = "main";
        gpg.format = "ssh";
      };
    };
    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        features = "decorations";
      };
    };
  };
}
