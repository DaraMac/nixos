{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    adwsteamgtk
    anki-bin
    bartib
    basedpyright # lsp
    bash-language-server # lsp
    bat
    bottles
    brave
    btop
    calibre
    dconf2nix
    deluge
    drawio
    dunst # hyprland
    fastfetch
    fd
    ferdium
    file
    gdu
    gimp3
    git
    gnome-podcasts
    gnome-sound-recorder
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
    goofcord
    haskell-language-server # lsp
    heroic
    hledger
    hledger-iadd
    hyprpaper # hyprpaper
    imagemagick # auto-accent requires it
    inkscape
    libnotify
    libreoffice
    libretrack
    lua-language-server
    lutris
    mousam # weather
    mpv
    newsflash
    nil # lsp
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
    rustdesk
    shortwave
    stow
    stretchly # no breaktimer on nix
    texliveFull
    thunderbird-latest
    tokei # code counter
    tree-sitter
    unrar-free
    unzip
    waybar # hyprland
    wl-clipboard
    wofi # hyprland
    yazi
    zathura
    zotero
    zsh-completions
    zsh-powerlevel10k
  ];
}
