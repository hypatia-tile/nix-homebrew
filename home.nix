{ pkgs, config, ... }:

{
  home.username = "kazukishinohara";
  home.homeDirectory = "/Users/kazukishinohara";
  home.stateVersion = "25.05"; # pick the current HM release or similar

  xdg.enable = true;

  programs.home-manager.enable = true;

  # user-level packages (no sudo):
  home.packages = with pkgs; [
    eza
    fd
    ripgrep
    bat
    fzf
    neovim
    vim
    tree
    htop
    # claude-code
  ];

  ######################
  # tmux via Home Manager
  ######################
  programs.tmux = {
    enable = true;
    # Use zsh as the default shell inside tmux
    shell = "${pkgs.zsh}/bin/zsh";
    # Nice default
    mouse = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 10000;
    # Recommended: fast, responsive escape-time
    escapeTime = 10;
    extraConfig = ''
      set -g status-style "bg=colour236 fg=white"
      set -g pane-border-style "fg=colour238"
      set -g pane-active-border-style "fg=colour39"

        unbind C-b
        set -g prefix C-q
        bind-key -n M-Up resize-pane -U 3
        bind-key -n M-Down resize-pane -D 3
        bind-key -n M-Left resize-pane -L 3
        bind-key -n M-Right resize-pane -R 3
    '';
  };

  ########################
  # Alacritty via Home Manager
  ########################
  programs.alacritty = {
    enable = true;
    # This writes TOML/YAML config to $XDG_CONFIG_HOME/allactirry/alacritty.toml or .yml
    # as documented in Home Manager. :contentReference[oaicite:0]{index=0}
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = 11.0;
      };
      colors = {
        primary = {
          background = "0x282c34";
          foreground = "0xabb2bf";
        };
        cursor = {
          text = "0x282c34";
          cursor = "0x528bff";
        };
        normal = {
          black = "0x282c34";
          red = "0xe06c75";
          green = "0x98c379";
          yellow = "0xe5c07b";
          blue = "0x61afef";
          magenta = "0xc678dd";
          cyan = "0x56b6c2";
          white = "0xabb2bf";
        };
      };

      window = {
        padding = {
          x = 10;
          y = 10;
        };
        dynamic_padding = true;
        decorations = "Buttonless";
        opacity = 0.75;
        blur = false;
        startup_mode = "Windowed";
      };

      scrolling = {
        history = 100000;
        multiplier = 3;
      };
    };
  };

  # example: enable some HM-managed programs
  programs.git = {
    enable = true;
    userName = "shinokun";
    userEmail = "hypatia.tile02021@grail.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
    };
  };
  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
  };
}
