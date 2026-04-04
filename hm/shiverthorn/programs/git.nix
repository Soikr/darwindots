{config, ...}: {
  programs = {
    git = {
      enable = true;
      signing.signByDefault = true;
      ignores = [
        ".DS_Store"
        "result"
      ];

      includes = [
        {
          path = config.sops.secrets.github_public_config.path;
        }
        {
          path = config.sops.secrets.github_work_config.path;
          condition = "gitdir:${config.home.homeDirectory}/Documents/Work/";
        }
      ];

      settings = {
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
    ssh.matchBlocks = {
      "github.com" = {
        addKeysToAgent = "yes";
        compression = true;
        identityFile = "${config.home.homeDirectory}/.ssh/git_auth";
      };
      "github.com-work" = {
        hostname = "github.com";
        addKeysToAgent = "yes";
        compression = true;
        identityFile = "${config.home.homeDirectory}/.ssh/git_work_auth";
      };
    };
  };
}
