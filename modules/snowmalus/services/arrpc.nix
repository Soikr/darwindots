{
  lib,
  pkgs,
  ...
}: {
  launchd.user.agents.arrpc = {
    command = lib.getExe pkgs.arrpc;
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/tmp/arrpc.log";
      StandardErrorPath = "/tmp/arrpc.error.log";
    };
  };
}
