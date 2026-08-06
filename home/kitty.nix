{ pkgs, ... }: {
  programs.kitty = {
    enable = true;
    font.name = "FiraCode Nerd Font";
    settings = {
      window_padding_width = 10;
      allow_remote_control = "yes";
      listen_on = "unix:/tmp/kitty";
      background_blur = 1;
      background_opacity = 0.90;
      cursor_trail = 1;
      modify_font = "cell_height 130%";
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
    };
    extraConfig = ''
      include dank-theme.conf
    '';
  };
}
