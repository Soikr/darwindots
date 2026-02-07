{...}: {
  networking = {
    useNetworkd = true;
    firewall.allowedUDPPorts = [51820];

    nat = {
      enable = true;
      enableIPv6 = true;
      externalInterface = "enp2s0";
      internalInterfaces = ["wg0"];
    };
  };

  systemd.network = {
    enable = true;

    networks."50-wg0" = {
      matchConfig.Name = "wg0";

      address = ["10.8.0.1/24"];

      networkConfig = {
        IPv4Forwarding = true;
        IPv6Forwarding = true;
      };
    };

    netdevs."50-wg0" = {
      netdevConfig = {
        Kind = "wireguard";
        Name = "wg0";
      };

      wireguardConfig = {
        FirewallMark = 42;
        ListenPort = 51820;
        RouteTable = "main";
        PrivateKeyFile = "";
      };

      wireguardPeers = [
        {
          PublicKey = "";
          AllowedIPs = ["192.168.1.0/24"];
        }
      ];
    };
  };
}
