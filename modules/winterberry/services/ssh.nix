{config, ...}: {
  services.openssh = {
    enable = true;
    ports = ["3837"];
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = config.my.user;
    };
  };
}
