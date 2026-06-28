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
    rustup
    cargo
    lua
    stylua
    nodejs
    typst
    python3
    duckdb
    gh
    git-filter-repo
  ];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
}
