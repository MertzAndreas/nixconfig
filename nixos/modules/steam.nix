{ pkgs, ... }:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # open ports for Remote Play
    dedicatedServer.openFirewall = true; # only needed if you host game servers
    gamescopeSession.enable = true; # lets you launch games/Steam itself via gamescope
  };

  programs.gamemode.enable = true; # perf optimizations while gaming

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # needed for most games/Proton
  };
}
