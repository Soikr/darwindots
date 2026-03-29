{config, ...}: {
  services = {
    fail2ban.enable = true;
    openssh = {
      enable = true;
      ports = [6534];

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
        AllowUsers = [config.my.user];
        AllowTcpForwarding = false;
        X11Forwarding = false;
        AllowAgentForwarding = false;
        AllowStreamLocalForwarding = false;
        AuthenticationMethods = "publickey";
      };
    };
  };

  users.users."${config.my.user}".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN2AlhQunhdQvL5/yA4aGMISqZq4WxD0HjdumyzcqASh soikr@snowmalus"
  ];
}
