# https://wiki.nixos.org/wiki/AMD_GPU
{pkgs, ...}: {
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu = {
      # AMDGPU for Sea Island card
      legacySupport.enable = true;

      opencl.enable = true;
    };
  };

  # Workaround for hardcoded HIP libraries
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
