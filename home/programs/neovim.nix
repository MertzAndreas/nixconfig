{ pkgs, ... }: {
  home.packages = with pkgs; [
    rust-analyzer
    lua-language-server
    nil
    roslyn-ls
    vtsls
    tailwindcss-language-server
    clang-tools
    tinymist
    basedpyright
    bash-language-server
  ];
}
