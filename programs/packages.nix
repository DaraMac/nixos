{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # rocq-core # coq
    # rocqPackages.stdlib # coq
    # rustdesk
    adwsteamgtk
    anki-bin
    bartib
    basedpyright # lsp
    bash-language-server # lsp
    bat
    better-control # niri
    bibata-cursors # niri
    bottles
    brave
    brightnessctl # niri
    btop
    calibre
    coq
    dconf2nix
    deluge # torrent
    diebahn # railway
    drawio
    dua # cli disk usage
    dunst # niri
    fastfetch
    fd
    ferdium
    file
    fluffychat
    foliate # gnome ebook reader
    fragments # torrent
    gimp3
    git
    gnome-boxes
    gnome-decoder # qr code generator
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
    goofcord # discord
    haskell-language-server # lsp
    helix
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
    texliveFull
    thunderbird-latest
    tokei # code counter
    tree-sitter
    tuba
    unrar-free
    unzip
    vscode-langservers-extracted # lsp
    waybar # niri
    waypaper
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
