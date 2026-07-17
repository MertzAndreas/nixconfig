{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    git
    ripgrep
    fd
    fzf
    tree-sitter
    neovim
    tmux
    duckdb
    gh
    git-filter-repo
  ];

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
}
