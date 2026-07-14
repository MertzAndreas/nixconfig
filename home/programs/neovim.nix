{ pkgs, ... }: {
  home.packages = with pkgs; [
    rust-analyzer
    lua-language-server
    nixd
    roslyn-ls
    vtsls
    tailwindcss-language-server
    clang-tools
    tinymist
    basedpyright
    bash-language-server

    delve 
    (python3.withPackages (ps: [ ps.debugpy ])) 
    lldb 
    netcoredbg 
  ];
}
