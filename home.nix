{ pkgs, lib, config, ... }:

{
    imports = [
        ./home-manager/ghostty.nix
        ./home-manager/git.nix
        ./home-manager/lsd.nix
        ./home-manager/mpd.nix
        ./home-manager/neovim.nix
        ./home-manager/rofi.nix
        ./home-manager/tmux.nix
        ./home-manager/zathura.nix
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

        "dunst" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dara/nixos/home-manager/dunst/";
            target = ".config/dunst/";
        };

        "hyprlock" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dara/nixos/home-manager/hypr/";
            target = ".config/hypr/";
        };

        "kando" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dara/nixos/home-manager/kando/";
            target = ".config/kando/";
        };

        "latexmk" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dara/nixos/home-manager/latexmk/";
            target = ".config/latexmk/latexmk/";
        };

        "niri" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dara/nixos/home-manager/niri/";
            target = ".config/niri/";
        };

        "waybar" = {
            source = config.lib.file.mkOutOfStoreSymlink "/home/dara/nixos/home-manager/waybar/";
            target = ".config/waybar/";
        };
    };
  };

  programs = {
    home-manager.enable = true;

    fzf.enable = true;
    zoxide.enable = true;
  };
}
