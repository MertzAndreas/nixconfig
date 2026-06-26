{ pkgs, ... }: {
  imports = [
    ./programs/niri.nix
    ./programs/kitty.nix
    ./programs/git.nix
    ./programs/shell.nix
    ./programs/neovim.nix
    ./programs/dms.nix
    ./programs/matugen
    ./scripts/default.nix
  ];

  home.stateVersion = "26.05";
}
