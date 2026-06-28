{
  pkgs,
  osConfig,
  ...
}:
let
  isNvidia = osConfig.hardware.nvidia.modesetting.enable or false;
in
{
  home.packages = [
    pkgs.bat
    pkgs.btop
    pkgs.vesktop
    pkgs.docker-client
    pkgs.docker-compose
    pkgs.dotnet-sdk
    pkgs.fastfetch
    pkgs.ffmpeg
    pkgs.firefox
    pkgs.jq
    pkgs.kitty
    pkgs.mpv
    pkgs.nautilus
    pkgs.obs-studio
    pkgs.opencode
    pkgs.pavucontrol
    (
      if isNvidia then
        pkgs.runCommand "sioyek-wrapped"
          {
            nativeBuildInputs = [ pkgs.makeWrapper ];
          }
          ''
            mkdir -p $out/bin
            makeWrapper ${pkgs.sioyek}/bin/sioyek $out/bin/sioyek \
              --set QT_QPA_PLATFORM xcb
          ''
      else
        pkgs.sioyek
    )
    pkgs.spotify
    pkgs.tealdeer
    pkgs.unrar
    pkgs.unzip
    pkgs.wl-clipboard
    pkgs.wl-mirror
  ];
}
