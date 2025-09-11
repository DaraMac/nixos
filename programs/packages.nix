{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    adwsteamgtk
    anki-bin
    bartib
    basedpyright # lsp
    bash-language-server # lsp
    bat
    bibata-cursors # hyprland
    bottles
    brave
    brightnessctl # hyprland
    btop
    calibre
    dconf2nix
    deluge
    drawio
    dunst # niri
    fastfetch
    fd
    ferdium
    file
    fluffychat
    gdu
    gimp3
    git
    gnome-maps
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
    grim # hyprland
    haskell-language-server # lsp
    heroic
    hledger
    hledger-iadd
    hyprlock # hyprland
    hyprpaper # hyprland
    hyprpicker # hyprland
    hyprsunset # hyprland
    hyprsysteminfo # hyprland
    imagemagick # auto-accent requires it
    inkscape
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
    overskride # hyprland
    p7zip
    pass
    pavucontrol # hyprland
    pinentry-gnome3
    playerctl # hyprland
    pricehist # hedger
    python3
    renameutils
    ripgrep
    ripgrep-all # also search in PDFs, E-Books, Office docs, zip, tar.gz, etc
    rofimoji # hyprland
    rustdesk
    shortwave
    slurp # hyprland
    stow
    stretchly # no breaktimer on nix
    sunsetr # niri
    swaynotificationcenter # hyprland
    swww # niri
    texliveFull
    thunderbird-latest
    tokei # code counter
    tree-sitter
    unrar-free
    unzip
    vscode-langservers-extracted # lsp
    waybar # hyprland
    waypaper
    waytrogen # niri
    wev
    wl-clipboard
    wlogout # hyprland
    xdg-desktop-portal-gtk # hyprland, to implement file picker apparently
    xwayland-satellite # niri
    yazi
    zathura
    zotero
    zsh-completions
    zsh-powerlevel10k
  ];
}
