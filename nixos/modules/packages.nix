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
    rust-analyzer
    cargo
    lua
    lua-language-server
    stylua
    nil
    nodejs
    vtsls
    tailwindcss-language-server
    clang-tools
    typst
    tinymist
    python3
    basedpyright
    bash-language-server
    duckdb
    gh
    git-filter-repo
  ];

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
}
