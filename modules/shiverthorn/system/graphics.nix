# https://wiki.nixos.org/wiki/AMD_GPU
# https://wiki.nixos.org/wiki/Intel_Graphics
# https://wiki.nixos.org/wiki/Accelerated_Video_Playback
{
  config,
  pkgs,
  ...
}: {
  # Intel driver
  services.xserver.videoDrivers = ["modesetting"];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = [pkgs.intel-vaapi-driver];
    };
    amdgpu = {
      # AMDGPU for Sea Island card
      legacySupport.enable = true;

      opencl.enable = true;
    };
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "i965";
    # Tell firefox-based browsers to use
    # intel igpu for Video Acceleration
    MOZ_DRM_DEVICE = "/dev/dri/renderD128";
  };
}
