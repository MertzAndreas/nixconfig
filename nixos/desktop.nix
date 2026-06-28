{ modulesPath, ... }: {
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
    ./configuration.nix
    ./hardware-configuration.nix
    ./modules/nvidia.nix
  ];

  networking.hostName = "desktop";
}
