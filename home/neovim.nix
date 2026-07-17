{ pkgs, ... }: {
  home.packages = with pkgs; [
    lua-language-server
    nixd
    nixfmt
    roslyn-ls
    vtsls
    tailwindcss-language-server
    clang-tools
    tinymist
    basedpyright
    bash-language-server

    delve
    lldb
    netcoredbg
  ];
}
