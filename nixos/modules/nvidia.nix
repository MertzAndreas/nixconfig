{
  config,
  lib,
  pkgs,
  ...
}:
{
  hardware.graphics.enable = true;
  hardware.nvidia.modesetting.enable = true;
  hardware.nvidia.open = false;
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  services.xserver.videoDrivers = [ "nvidia" ];

  boot.kernelParams = [ "nvidia_drm.modeset=1" ];
  boot.blacklistedKernelModules = [ "nouveau" ];
}
