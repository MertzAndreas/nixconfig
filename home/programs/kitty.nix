{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font.name = "CaskaydiaMono Nerd Font";
    settings = {
      window_padding_width = 10;
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      background_blur = 1;
      background_opacity = 0.90;
      cursor_trail = 1;
    };
    extraConfig = ''
      include dank-theme.conf
    '';
  };
}
