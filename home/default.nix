{ pkgs, ... }: {
  imports = [
    ./programs/niri.nix
    ./programs/kitty.nix
    ./programs/git.nix
    ./programs/shell.nix
    ./programs/packages.nix
    ./programs/neovim.nix
    ./programs/dms.nix
    ./programs/matugen
    ./scripts/default.nix
  ];

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 20;
  };

  home.stateVersion = "26.05";
}
