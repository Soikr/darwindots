{
  systemd.network = {
    enable = true;
    networks = {
      "10-lan" = {
        matchConfig.Name = ["enp2s0" "vm-*"];
        networkConfig = {
          Bridge = "br0";
        };
      };
      "10-lan-bridge" = {
        matchConfig.Name = "br0";
        networkConfig = {
          IPv6AcceptRA = true;
          DHCP = true;
        };
        linkConfig.RequiredForOnline = "routable";
      };
    };
    netdevs."br0".netdevConfig = {
      Name = "br0";
      Kind = "bridge";
    };
  };
}
