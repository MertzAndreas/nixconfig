{ modulesPath, ... }: {
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
    ./configuration.nix
    ./hardware-configuration-laptop.nix
  ];

  networking.hostName = "laptop";
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
}
