{ pkgs, ...}:
{
    environment.systemPackages = with pkgs; [
        adwsteamgtk
        anki
        bartib
        bat
        # bottles
        brave
        btop
        dconf2nix
        deluge
        fastfetch
        fd
        ferdium
        file
        fzf
        gcc
        gdu
        git
        gnome-tweaks
        gnome-user-share
        gnome-weather
        gnomeExtensions.appindicator
        gnomeExtensions.auto-accent-colour
        gnomeExtensions.dash-to-dock
        gnomeExtensions.forge
        gnomeExtensions.night-theme-switcher
        gnomeExtensions.rounded-window-corners-reborn
        gnumake
        gnupg
        # heroic
        hledger
        hledger-iadd
        imagemagick # auto-accent requires it
        inkscape
        kitty
        libnotify
        libreoffice
        lsd
        lutris
        mousam # weather
        mpv
        newsflash
        nodejs-slim
        obsidian
        p7zip
        pass
        pinentry-gnome3
        prismlauncher
        puffin
        python3
        renameutils
        ripgrep
        stow
        stretchly # no breaktimer on nix
        swaynotificationcenter
        texliveFull
        thunderbird
        tmux
        tree-sitter
        unrar-free
        unzip
        vesktop
        wl-clipboard
        wofi
        yazi
        zathura
        zotero_7
        zoxide
        zsh-powerlevel10k
    ];
}
