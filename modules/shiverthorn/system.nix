{pkgs, ...}: {
  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  security.apparmor = {
    enable = true;
    killUnconfinedConfinables = true;
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu = {
      legacySupport.enable = true;
      opencl.enable = true;
    };
  };

  systemd.tmpfiles.rules = let
    rocmEnv = pkgs.symlinkJoin {
      name = "rocm-combined";
      paths = with pkgs.rocmPackages; [
        rocblas
        hipblas
        clr
      ];
    };
  in [
    "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  ];
}
