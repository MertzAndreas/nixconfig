{ modulesPath, ... }: {
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/locale.nix
    ./modules/users.nix
    ./modules/packages.nix
    ./modules/nix.nix
    ./modules/bluetooth.nix
    ./modules/fonts.nix
    ./modules/nvidia.nix
    ./modules/display-manager.nix
  ];

  system.stateVersion = "26.05";
}
