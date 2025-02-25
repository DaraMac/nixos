{ pkgs, ...}:
{
    environment.systemPackages = with pkgs; [

        adwsteamgtk
        anki
        bartib
        bat
        bottles
        brave
        btop
        dconf2nix
        deluge
        fastfetch
        fd
        ferdium
        file
        gdu
        ghostty
        git
        gnome-podcasts
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
        heroic
        hledger
        hledger-iadd
        imagemagick # auto-accent requires it
        inkscape
        libnotify
        libreoffice
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
        python3
        renameutils
        ripgrep
        ripgrep-all # also search in PDFs, E-Books, Office docs, zip, tar.gz, etc
        stow
        stretchly # no breaktimer on nix
        texliveFull
        thunderbird-latest
        tokei
        tree-sitter
        unrar-free
        unzip
        vesktop
        wl-clipboard
        yazi
        zathura
        zotero
        zsh-completions
        zsh-powerlevel10k
    ];
}
