{pkgs, ...}: let
  discord-rpc-pkg = pkgs.callPackage ./rpc.nix {};
in {
  launchd.user.agents.discord-rpc-extension = {
    command = "${discord-rpc-pkg}/bin/discord-rpc-server";
    serviceConfig = {
      RunAtLoad = true;
      KeepAlive = true;
      StandardOutPath = "/tmp/discord-rpc.log";
      StandardErrorPath = "/tmp/discord-rpc.error.log";
    };
  };
}
