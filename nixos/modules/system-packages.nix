{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    xwayland-satellite
    git
    ripgrep
    fd
    fzf
    tree-sitter
    neovim
    tmux
    gh
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
}
