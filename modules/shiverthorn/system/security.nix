# https://wiki.nixos.org/wiki/NixOS_Hardening
# https://xeiaso.net/blog/paranoid-nixos-2021-07-18
{
  security = {
    sudo = {
      execWheelOnly = true;

      # Sudo always shows lecture due to rollback
      # Useless to me anyways
      extraConfig = "Defaults lecture = never";
    };
    apparmor = {
      enable = true;
      killUnconfinedConfinables = true;
    };
  };

  boot = {
    kernelParams = [
      # Enable page allocator randomization
      "page_alloc.shuffle=1"

      # Disable debugfs
      "debugfs=off"
    ];
    kernel.sysctl = {
      # Hide kptrs even for processes with CAP_SYSLOG
      "kernel.kptr_restrict" = "2";

      # Disable ftrace debugging
      "kernel.ftrace_enabled" = false;

      # Enable strict reverse path filtering (that is, do not attempt to route
      # packets that "obviously" do not belong to the iface's network; dropped
      # packets are logged as martians).
      "net.ipv4.conf.all.log_martians" = true;
      "net.ipv4.conf.all.rp_filter" = "1";
      "net.ipv4.conf.default.log_martians" = true;
      "net.ipv4.conf.default.rp_filter" = "1";

      # Ignore broadcast ICMP (mitigate SMURF)
      "net.ipv4.icmp_echo_ignore_broadcasts" = true;

      # Ignore incoming ICMP redirects (note: default is needed to ensure that the
      # setting is applied to interfaces added after the sysctls are set)
      "net.ipv4.conf.all.accept_redirects" = false;
      "net.ipv4.conf.all.secure_redirects" = false;
      "net.ipv4.conf.default.accept_redirects" = false;
      "net.ipv4.conf.default.secure_redirects" = false;
      "net.ipv6.conf.all.accept_redirects" = false;
      "net.ipv6.conf.default.accept_redirects" = false;

      # Ignore outgoing ICMP redirects (this is ipv4 only)
      "net.ipv4.conf.all.send_redirects" = false;
      "net.ipv4.conf.default.send_redirects" = false;
    };
  };
}
