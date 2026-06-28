{ modulesPath, ... }: {
  imports = [
    "${modulesPath}/installer/scan/not-detected.nix"
    ./configuration.nix
    ./hardware-configuration-laptop.nix
    ./modules/amd.nix
  ];

  networking.hostName = "laptop";
}
