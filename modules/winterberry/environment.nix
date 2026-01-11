{pkgs, ...}: {
  environment = {
    systemPackages = with pkgs; [
      helix
      git
    ];

    shellAliases = {
      ll = "eza -l";
      la = "eza -a";
      lla = "eza -al";

      # Overrides
      cat = "bat";

      # Programs
      g = "git";
    };

    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };
}
