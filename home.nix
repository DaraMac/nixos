{ pkgs, lib, ... }:

{
    imports = [
        ./home-manager/git.nix
        ./home-manager/neovim.nix
        ./home-manager/tmux.nix
        ./home-manager/zsh.nix
    ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "dara";
    homeDirectory = "/home/dara";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager releases introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager releases notes for a list of state version
    # changes in each release.
    stateVersion = "25.05";

    file = {
        "hledger-iadd" = {
            target = ".config/hledger-iadd/config.conf";
            text = ''date-format = "%Y-%m-%d"'';
        };

        "p10k.zsh" = {
            source = ./home-manager/dot-p10k.zsh;
            target = ".config/p10k/p10k.zsh";
        };
    };
  };

  programs = {
    home-manager.enable = true;

    ghostty = {
        enable = true;
        settings = {
            font-family = "-calt"; # disable ligatures
            theme = "catppuccin-macchiato";
        };
    };

    fzf.enable = true;
    zoxide.enable = true;

    lsd = {
      enable = true;
      settings = {
        date = "relative";
        sorting.dir-grouping = "first";
        symlink-arrow = "→";
      };
    };

    rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        plugins = [ pkgs.rofi-calc ];
    };

    zathura = {
      enable = true;
      options = {
        # to make it copy to the GUI clipboard upon highlight selecting
        # https://unix.stackexchange.com/a/339488
        selection-clipboard = "clipboard";
      };
    };
  };
}
