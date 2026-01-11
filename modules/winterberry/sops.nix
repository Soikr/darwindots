{inputs, ...}: let
  secretsPath = builtins.toString inputs.secrets;
in {
  sops = {
    defaultSopsFile = "${secretsPath}/secrets.yaml";
    validateSopsFiles = false;

    age = {
      sshKeyPaths = ["/etc/ssh/ssh_host_ed25519_key"];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets = {
      admin-passwd = {};
      vmuser-passwd = {};
    };
  };
}
