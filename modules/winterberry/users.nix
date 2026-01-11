{config, ...}: {
  sops.secrets.admin-passwd.neededForUsers = true;
  users.mutableUsers = false;

  users.users."${config.my.user}" = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    hashedPasswordFile = config.sops.secrets.admin-passwd.path;
  };
}
