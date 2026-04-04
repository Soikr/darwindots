{
  inputs,
  config,
  ...
}: let
  secretsPath = builtins.toString inputs.secrets;
in {
  sops = {
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    validateSopsFiles = false;

    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";

    secrets = {
      "github_public_config".path = "${config.home.homeDirectory}/.config/git/github_public";
      "github_work_config".path = "${config.home.homeDirectory}/.config/git/github_work";
    };
  };
}
