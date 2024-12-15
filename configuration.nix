{ config, pkgs, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
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

    # Enable GNOME desktop
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "gb";
        variant = "";
    };

    # Configure console keymap
    console.keyMap = "uk";


    environment.gnome.excludePackages = with pkgs; [
        epiphany
        evince
        geary
        gnome-connections
        gnome-logs
        gnome-maps
        gnome-music
        gnome-system-monitor
        gnome-text-editor
        gnome-tour
        kgx # gnome terminal
        simple-scan
        snapshot
        totem
        yelp
    ];

    # GNOME configuration
    programs.dconf = {
        enable = true;
        profiles.user.databases = [
            {
                lockAll = true; # prevents overriding
                settings = {
                    "org/gnome/desktop/interface" = {
                        clock-show-weekday = true;
                        enable-hot-corners = true;
                    };

                    "org/gnome/desktop/wm/preferences" = {
                        focus-mode = "mouse";
                    };

                    "org/gnome/desktop/peripherals/mouse" = {
                        natural-scroll = true;
                    };

                    "org/gnome/mutter" = {
                        dynamic-workspaces = true;
                    };

                    "org/gnome/shell" = {
                        "app-switcher/current-workspace-only" = false;

                        disable-user-extensions = false;
                        favorite-apps = [
                            "org.gnome.Nautilus.desktop"
                            "firefox.desktop"
                            "thunderbird.desktop"
                            "anki.desktop"
                            "kitty.desktop"
                            "org.gnome.Calendar.desktop"
                            "org.gnome.Settings.desktop"
                        ];

                        enabled-extensions = [
                            "appindicatorsupport@rgcjonas.gmail.com"
                            "dash-to-dock@micxgx.gmail.com"
                            "drive-menu@gnome-shell-extensions.gcampax.github.com"
                            "forge@jmmaranan.com"
                            "gsconnect@andyholmes.github.io"
                            "nightthemeswitcher@romainvigier.fr"
                            "rounded-window-corners@fxgn"
                        ];
                    };


                    "org/gnome/settings-daemon/plugins/color" = {
                        night-light-enabled = true;
                        night-light-schedule-automatic = true;
                        night-light-temperature = pkgs.lib.gvariant.mkUint32 4135;
                    };

                    "org/gnome/settings-daemon/plugins/media-keys" = {
                        www = ["<Super>b"];
			search = ["<Super>space"];
                    };


		    "org/gnome/desktop/wm/keybindings" = {
		        # disable these so they don't clash with the search shortcut
		    	switch-input-source = pkgs.lib.gvariant.mkEmptyArray (pkgs.lib.gvariant.type.string);
			switch-input-source-backward = pkgs.lib.gvariant.mkEmptyArray (pkgs.lib.gvariant.type.string);
			close = ["<Shift><Super>q"];
		    };

		# /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding '<Super>Return'
		# /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command 'kitty'
		# /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name 'Launch kitty'
		#
		# /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings ['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']

		# /org/gnome/clocks/world-clocks [{'location': <(uint32 2, <('Anywhere on Earth (AoE)', '@AoE', false, @a(dd) [], @a(dd) [])>)>}]

		# /org/gnome/shell/world-clocks/locations [<(uint32 2, <('Anywhere on Earth (AoE)', '@AoE', false, @a(dd) [], @a(dd) [])>)>]
                };
            }
        ];
    };

    # Get fonts, including all nerdfonts
    fonts.packages = with pkgs; [ meslo-lgs-nf ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

    # Enable Hyprland
    programs.hyprland.enable = true;

    # Enable OpenGL
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {

        # Modesetting is required.
        modesetting.enable = true;

        # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
        # Enable this if you have graphical corruption issues or application crashes after waking
        # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead 
        # of just the bare essentials.
        powerManagement.enable = false;

        # Fine-grained power management. Turns off GPU when not in use.
        # Experimental and only works on modern Nvidia GPUs (Turing or newer).
        powerManagement.finegrained = false;

        # Use the NVidia open source kernel module (not to be confused with the
        # independent third-party "nouveau" open source driver).
        # Support is limited to the Turing and later architectures. Full list of 
        # supported GPUs is at: 
        # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
        # Only available from driver 515.43.04+
        # Currently alpha-quality/buggy, so false is currently the recommended setting.
        open = false;

        # Enable the Nvidia settings menu,
        # accessible via `nvidia-settings`.
        nvidiaSettings = true;

        # Optionally, you may need to select the appropriate driver version for your specific GPU.
        package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    hardware.pulseaudio.enable = false;
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

    # Install firefox
    programs.firefox.enable = true;
    programs.firefox.nativeMessagingHosts.packages = with pkgs; [passff-host];

    # Set up zsh
    programs.zsh = {
        enable = true;
        autosuggestions.enable = true;
        syntaxHighlighting.enable = true;
        promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        ohMyZsh = {
            enable = true;
            plugins = [
            ];
        };
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
