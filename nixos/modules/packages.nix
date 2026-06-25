{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    git
    gcc
    ripgrep
    fd
    fzf
    tree-sitter
    neovim
    tmux
  ];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
}
