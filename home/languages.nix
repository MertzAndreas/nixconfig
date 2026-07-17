{ pkgs, ... }: {
  home.packages = with pkgs; [
    rustup

    go

    dotnet-sdk

    (python3.withPackages (ps: [ ps.debugpy ]))

    lua
    stylua

    gcc

    nodejs

    typst
  ];
}
