{ pkgs, ... }: {
  imports = [
    ./niri.nix
    ./kitty.nix
    ./git.nix
    ./shell.nix
    ./packages.nix
    ./languages.nix
    ./neovim.nix
    ./dms.nix
    ./matugen
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
