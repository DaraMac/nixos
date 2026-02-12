{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # rustdesk # remote desktop
    adwsteamgtk # gaming
    anki-bin # flashcards
    apostrophe # markdown editor / previewer
    bartib # time tracker
    basedpyright # lsp
    bash-language-server # lsp
    bat # cli
    bat-extras.batdiff # cli
    bat-extras.batgrep # cli
    bat-extras.batman # cli
    better-control # niri
    bibata-cursors # niri
    blanket # sounds
    bottles # windows gaming
    brightnessctl # niri
    btop # system monitor
    calibre # ebooks
    cartridges # gaming launcher
    dconf2nix # gnome nix
    dialect # translate
    diebahn # railway
    drawio # graphics
    dua # cli disk usage
    dunst # niri
    eartag # music tag editor
    embellish # nerd fonts manager
    euphonica # music player mpd
    eyedropper # gnome colour picker
    fastfetch # system info
    fd # cli
    ferdium # messaging
    file # cli
    file-roller # archiver
    flac # music, just for metaflac tag tool
    fluffychat # matrix messaging
    fragments # torrent
    gimp3 # graphics
    git # dev tools
    gnome-boxes # vm
    gnome-decoder # qr code generator
    gnome-podcasts # podcasts
    gnome-sound-recorder # audio
    gnome-tweaks # configuration
    gnome-weather # weather
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.paperwm
    gnumake # dev tools
    gnupg # cryptography
    goofcord # discord
    haskell-language-server # lsp
    heroic # gaming
    hieroglyphic # latex symbols
    hledger # finance
    hledger-iadd # finance
    hyprlock # niri
    imagemagick # auto-accent requires it
    inkscape # graphics
    jdt-language-server # lsp jdtls
    just # dev tools
    kando # pie menu
    libnotify # notifications
    libreoffice # office
    lua-language-server # lsp
    lutris # gaming
    mousam # weather
    mpv # media
    newsflash
    nil # lsp
    noctalia-shell # niri desktop
    nodejs-slim
    obsidian # notes
    overskride # bluetooth
    p7zip # cli
    pass # passwords
    pavucontrol # niri
    pinentry-gnome3 # passwords
    playerctl # niri
    python3 # dev tools
    recordbox # music player
    renameutils # cli
    resources # gnome circle system monitor
    ripgrep # cli
    ripgrep-all # cli also search in PDFs, E-Books, Office docs, zip, tar.gz, etc
    rmpc # cli music player
    rofimoji # niri
    shortwave # radio media
    showtime # gnome video player
    stow # cli dotfiles
    stretchly # no breaktimer on nix
    sunsetr # niri
    swww # niri
    texliveFull # latex
    thunderbird-latest # email
    tokei # cli dev tools code counter
    tree-sitter # dev tools
    tuba # mastodon social media
    unrar-free # cli
    unzip # cli
    vscode-langservers-extracted # html css json lsp
    waybar # niri
    wev # wayland
    wl-clipboard # wayland niri
    wlogout # niri
    wordbook # gnome dictionary
    xdg-desktop-portal-gtk # hyprland, to implement file picker apparently
    xwayland-satellite # niri
    yazi # cli
    zathura # office
    zip # cli
    zotero # bibliography
    zsh-completions # cli
    zsh-powerlevel10k # cli
  ];
}
