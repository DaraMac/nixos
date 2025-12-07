{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    adwsteamgtk # gaming
    anki-bin # flashcards
    bartib # time tracker
    basedpyright # lsp
    bash-language-server # lsp
    bat # cli
    better-control # niri
    bibata-cursors # niri
    blanket # sounds
    bottles # gaming
    brightnessctl # niri
    btop # system monitor
    calibre # ebooks
    dconf2nix # gnome nix
    diebahn # railway
    drawio # graphics
    dua # cli disk usage
    dunst # niri
    euphonica # test music player mpd
    fastfetch # system info
    fd # cli
    ferdium # messaging
    file # cli
    file-roller # archiver
    flac # music, just for metaflac tag tool
    fluffychat # messaging
    fragments # torrent
    gapless # music player
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
    kando # pie menu
    libnotify # notifications
    libreoffice # office
    lua-language-server # lsp
    lutris # gaming
    mousam # weather
    mpv # media
    newsflash
    nil # lsp
    nodejs-slim
    obsidian # notes
    overskride # niri
    p7zip # cli
    pass # passwords
    pavucontrol # niri
    pinentry-gnome3 # passwords
    playerctl # niri
    python3 # dev tools
    readest # ebooks
    renameutils # cli
    resources # gnome circle system monitor
    ripgrep # cli
    ripgrep-all # cli also search in PDFs, E-Books, Office docs, zip, tar.gz, etc
    rmpc # cli music player
    rofimoji # niri
    rustdesk # remote desktop
    shortwave # media
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
    ungoogled-chromium # browser
    unrar-free # cli
    unzip # cli
    vscode-langservers-extracted # html css json lsp
    waybar # niri
    wev # wayland
    wl-clipboard # wayland niri
    wlogout # niri
    xdg-desktop-portal-gtk # hyprland, to implement file picker apparently
    xwayland-satellite # niri
    yazi # cli
    zathura # office
    zotero # bibliography
    zsh-completions # cli
    zsh-powerlevel10k # cli
  ];
}
