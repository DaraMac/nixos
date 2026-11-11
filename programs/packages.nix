{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # newsflash
    # pyrefly # python
    # zotero # bibliography
    adwsteamgtk # gaming
    anki-bin # flashcards
    apostrophe # markdown editor / previewer
    basedpyright # lsp
    bash-language-server # lsp
    bat # cli
    bat-extras.batdiff # cli
    bat-extras.batgrep # cli
    bat-extras.batman # cli
    blanket # sounds
    bottles # windows gaming
    btop # system monitor
    calibre # ebooks
    cartridges # gaming launcher
    dconf2nix # gnome nix
    dialect # translate
    diebahn # railway
    dua # cli disk usage
    fastfetch # system info
    fd # cli
    ferdium # messaging
    file # cli
    file-roller # archiver
    fluffychat # matrix messaging
    fragments # torrent
    git # dev tools
    gnome-boxes # vm
    gnome-decoder # qr code generator
    gnome-podcasts # podcasts
    gnome-sound-recorder # audio
    gnome-tweaks # configuration
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.night-theme-switcher
    gnumake # dev tools
    gnupg # cryptography
    goofcord # discord
    haskell-language-server # lsp
    hayagriva # bibliography
    heroic # gaming
    hieroglyphic # latex symbols
    hledger # finance
    hledger-iadd # finance
    jdk # java for nagini python
    jdt-language-server # lsp jdtls
    just # dev tools
    lua-language-server # lsp
    lutris # gaming
    mpv # media
    mypy # python
    nil # lsp
    nodejs-slim
    obsidian # notes
    onlyoffice-desktopeditors # office
    p7zip # cli
    pass # passwords
    pinentry-gnome3 # passwords
    pyright # python
    python3 # dev tools
    renameutils # cli
    resources # gnome circle system monitor
    ripgrep # cli
    rnote # drawing pad
    shortwave # radio media
    showtime # gnome video player
    stow # cli dotfiles
    stretchly # no breaktimer on nix
    thunderbird-latest # email
    tinymist # lsp
    tokei # cli dev tools code counter
    transmission_4-gtk # torrent
    tree-sitter # dev tools
    tuba # mastodon social media
    ty # python
    typst # documents
    unrar-free # cli
    unzip # cli
    uv # python
    vscode-langservers-extracted # html css json lsp
    wl-clipboard # wayland clipboard commands
    wordbook # gnome dictionary
    yazi # cli
    yq-go # yaml processer
    zathura # office
    zip # cli
    zsh-completions # cli
    zsh-powerlevel10k # cli
  ];
}
