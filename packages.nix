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
    cabal-install # haskell
    calibre
    dconf2nix
    deluge
    drawio
    fastfetch
    fd
    ferdium
    file
    gdu
    ghc # haskell
    ghcid # haskell
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
    gnum4 # haskell
    gnumake
    gnupg
    groff # haskell
    haskell-language-server # lsp
    haskellPackages.hasktags # haskell
    haskellPackages.quickbench # haskell
    haskellPackages.shelltestrunner # haskell
    heroic
    hledger
    hledger-iadd
    imagemagick # auto-accent requires it
    inkscape
    just # haskell
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
    pandoc # haskell
    pass
    pinentry-gnome3
    prismlauncher
    python3
    renameutils
    ripgrep
    ripgrep-all # also search in PDFs, E-Books, Office docs, zip, tar.gz, etc
    rustdesk
    shortwave
    stack # haskell
    stow
    stretchly # no breaktimer on nix
    texliveFull
    thunderbird-latest
    tokei # code counter
    tree-sitter
    unrar-free
    unzip
    vesktop
    watchexec # haskell
    wl-clipboard
    wofi # hyprland
    yazi
    zathura
    zotero
    zsh-completions
    zsh-powerlevel10k
  ];
}
