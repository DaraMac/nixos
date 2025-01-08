{ config, pkgs, ... }:

{
    imports =
        [ 
	    ./firefox.nix
	    ./graphics.nix
            ./gnome.nix
            ./hardware-configuration.nix
            ./packages.nix
        ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable networking
    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Dublin";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_IE.UTF-8";
        LC_IDENTIFICATION = "en_IE.UTF-8";
        LC_MEASUREMENT = "en_IE.UTF-8";
        LC_MONETARY = "en_IE.UTF-8";
        LC_NAME = "en_IE.UTF-8";
        LC_NUMERIC = "en_IE.UTF-8";
        LC_PAPER = "en_IE.UTF-8";
        LC_TELEPHONE = "en_IE.UTF-8";
        LC_TIME = "en_IE.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "gb";
        variant = "";
    };

    # Configure console keymap
    console.keyMap = "uk";

    # Get fonts, including all nerdfonts
    fonts.packages = with pkgs; [ meslo-lgs-nf ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

    # Enable Hyprland
    programs.hyprland.enable = true;

    # Enable CUPS to print documents.
    services.printing.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    # Define a user account.
    users.users.dara = {
        isNormalUser = true;
        description = "Dara MacConville";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
        ];
    };

    # Enable automatic login for the user.
    services.displayManager.autoLogin.enable = false;
    services.displayManager.autoLogin.user = "dara";

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # Set up zsh
    programs.zsh = {
        enable = true;
        # autosuggestions.enable = true;
        # syntaxHighlighting.enable = true;
        promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        # ohMyZsh = {
        #     enable = true;
        #     plugins = [
        #     ];
        # };
    };

    users.defaultUserShell = pkgs.zsh;

    programs.neovim = {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
    };

    programs.steam.enable = true;
    programs.steam.gamescopeSession.enable = true;
    programs.gamemode.enable = true;

    programs.kdeconnect = {
        enable = true;
        package = pkgs.gnomeExtensions.gsconnect;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    xdg.mime.defaultApplications = {
        "default-web-browser" = "firefox.desktop";
    };

    # Add media controls to mpv so KDE Connect works, and make the UI nicer
    nixpkgs.overlays = [
        (self: super: {
            mpv = super.mpv.override {
                scripts = [ self.mpvScripts.mpris self.mpvScripts.modernx ];
            };
        })
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?
}
