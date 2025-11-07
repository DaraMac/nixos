{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # rustdesk
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
    brave # browser
    brightnessctl # niri
    btop # system monitor
    calibre # ebooks
    coqPackages.vscoq-language-server # rocq vscode lsp
    dconf2nix
    diebahn # railway
    drawio # graphics
    dua # cli disk usage
    dunst # niri
    fastfetch # system info
    fd # cli
    ferdium # messaging
    file # cli
    fluffychat # messaging
    foliate # gnome ebook reader
    fragments # torrent
    gimp3 # graphics
    git # dev tools
    gnome-boxes # vm
    gnome-decoder # qr code generator
    gnome-podcasts # podcasts
    gnome-solanum # pomodoro
    gnome-sound-recorder # audio
    gnome-tweaks # configuration
    gnome-user-share
    gnome-weather # weather
    gnomeExtensions.appindicator
    gnomeExtensions.auto-accent-colour
    gnomeExtensions.dash-to-dock
    gnomeExtensions.forge
    gnomeExtensions.night-theme-switcher
    gnomeExtensions.rounded-window-corners-reborn
    gnumake # dev tools
    gnupg # cryptography
    goofcord # discord
    haskell-language-server # lsp
    heroic
    hieroglyphic # latex symbols
    hledger
    hledger-iadd
    hyprlock # niri
    imagemagick # auto-accent requires it
    inkscape
    jdt-language-server # lsp jdtls
    kando
    libnotify
    libreoffice
    lua-language-server # lsp
    lutris
    mousam # weather
    mpv
    newsflash
    nil # lsp
    nodejs-slim
    obsidian
    overskride # niri
    p7zip
    pass
    pavucontrol # niri
    pinentry-gnome3
    playerctl # niri
    python3
    renameutils
    resources # gnome circle system monitor
    ripgrep
    ripgrep-all # also search in PDFs, E-Books, Office docs, zip, tar.gz, etc
    rofimoji # niri
    shortwave
    showtime # gnome video player
    stow
    stretchly # no breaktimer on nix
    sunsetr # niri
    swww # niri
    tangram # web apps
    texliveFull
    thunderbird-latest
    tokei # code counter
    transmission_4 # torrent
    tree-sitter
    tuba
    unrar-free
    unzip
    vscode-langservers-extracted # html css json lsp
    vscodium-fhs # rocq
    waybar # niri
    wev
    wl-clipboard
    wlogout # niri
    xdg-desktop-portal-gtk # hyprland, to implement file picker apparently
    xwayland-satellite # niri
    yazi
    zathura
    zotero
    zsh-completions
    zsh-powerlevel10k
  ];
}
