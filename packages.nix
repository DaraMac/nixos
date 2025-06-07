{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    adwsteamgtk
    anki-bin
    bartib
    basedpyright # lsp
    bash-language-server
    bat
    bottles
    brave
    btop
    cabal-install
    calibre
    dconf2nix
    deluge
    drawio
    fastfetch
    fd
    ferdium
    file
    gdu
    ghc
    gimp3
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
    haskell-language-server
    heroic
    hledger
    hledger-iadd
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
    nil # nix lsp
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
    stack
    stow
    stretchly # no breaktimer on nix
    texliveFull
    thunderbird-latest
    tokei # code counter
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
