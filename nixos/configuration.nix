{ ... }: {
  imports = [
    ./modules/boot.nix
    ./modules/networking.nix
    ./modules/locale.nix
    ./modules/users.nix
    ./modules/system-packages.nix
    ./modules/nix.nix
    ./modules/bluetooth.nix
    ./modules/fonts.nix
    ./modules/display-manager.nix
  ];

  system.stateVersion = "26.05";
}
