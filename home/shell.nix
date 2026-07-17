{ ... }: {
  programs.bash.enable = false;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "docker"
        "docker-compose"
        "dotnet"
      ];
    };
    envExtra = ''
      export EDITOR="nvim"
      export VISUAL="nvim"
      export MANPAGER="nvim +Man!"
      export MOZ_ENABLE_WAYLAND=1
      export PATH="$HOME/.cargo/bin:$PATH"
      export PATH="$HOME/go/bin:$PATH"
      export PATH="$HOME/.dotnet/tools:$PATH"
      export DOCKER_BUILDKIT=1
    '';
    shellAliases = {
      ls = "eza -lh --group-directories-first --icons=auto";
      lsa = "eza --long -a";
      ll = "eza -lh";
      la = "eza -lAh";
      l = "eza -lah";
      lt = "eza --tree --level=2 --long --icons --git";
      ltt = "eza --tree --level=3 --long --icons --git";
      lttt = "eza --tree --level=4 --long --icons --git";
      tree = "eza --oneline --tree";
      n = "nvim";
      g = "git";
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      md = "mkdir -p";
      rd = "rmdir";
      dc = "docker-compose";
      venv = "source .venv/bin/activate";
      "edit-in-kitty" = "kitten edit-in-kitty";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };
}
