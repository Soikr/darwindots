{config, ...}: {
  programs = {
    git = {
      enable = true;
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOOpnM2LX8mRI11m1NIq6xLHPlj1MzhaUmD5sEb39nQb Soikr@proton.me";
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
    ssh.matchBlocks = {
      "github.com" = {
        UseKeychain = "yes";
        addKeysToAgent = "yes";
        identityFile = "~/.ssh/git";
      };
    };
  };
}
