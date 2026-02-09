{ config, pkgs, ... }:

{
    imports =
        [
            ./hardware/laptop/bootloader.nix
            ./hardware/laptop/hardware.nix
            # ./hardware/desktop/bootloader.nix
            # ./hardware/desktop/hardware.nix
            ./hardware/graphics.nix
            ./programs/firefox.nix
            ./programs/gnome.nix
            ./programs/packages.nix
        ];

    nix =  {
        gc = {
            automatic = true;
            dates = "weekly";
        };
        settings = {
            experimental-features = [ "nix-command" "flakes" ];
            auto-optimise-store = true;
        };
    };

    # Enable networking
    networking = {
        hostName = "nixos"; # Define your hostname.
        networkmanager.enable = true;
    };

    # Set your time zone.
    time.timeZone = "Europe/Dublin";

    # Select internationalisation properties.
    i18n = {
        defaultLocale = "en_GB.UTF-8";

        extraLocaleSettings = {
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
    };

    # PipeWire uses this to acquire realtime priority
    security.rtkit.enable = true;

    services = {
        # Enable automatic login for the user.
        displayManager = {
            autoLogin = {
                enable = false;
                user = "dara";
            };
        };

        orca.enable = false;

        pipewire = {
            alsa = {
                enable = true;
                support32Bit = true;
            };
            enable = true;
            pulse.enable = true;
        };

        power-profiles-daemon.enable = true; # noctalia
        upower.enable = true; # noctalia

        # Enable CUPS to print documents.
        printing.enable = true;

        # Enable the X11 windowing system.
        xserver = { 
            enable = true;

            # Configure keymap in X11
            xkb = {
                layout = "gb";
                variant = "";
            };
        };
    };

    # Configure console keymap
    console.keyMap = "uk";

    # Get fonts, including all nerdfonts
    fonts.packages = with pkgs; [ noto-fonts noto-fonts-cjk-sans meslo-lgs-nf fira-code] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

    users = {
        defaultUserShell = pkgs.zsh;

        # Define a user account.
        users.dara = {
            description = "Dara MacConville";
            extraGroups = [ "networkmanager" "wheel" ];
            isNormalUser = true;
        };

        groups.libvirtd.members = ["dara"]; # vm
    };

    # vm
    virtualisation = {
        containers.enable = true; # necessary for podman apparently

        docker = {
            enable = true;
            rootless = {
                enable = true;
                setSocketVariable = true;
            };
        };

        podman = {
            enable = true;
            dockerCompat = true;
            defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
        };

        libvirtd.enable = true;
        spiceUSBRedirection.enable = true;
    };


    programs = {
        appimage = {
            enable = true;
            binfmt = true;
        };

        niri.enable = true;

        # Set up zsh
        zsh = {
            enable = true;
            promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        };

        steam = {
            enable = true;
            gamescopeSession.enable = true;
        };
        gamemode.enable = true;

        kdeconnect = {
            enable = true;
        };

        # enabled this to get uv working
        nix-ld.enable = true;

        # Some programs need SUID wrappers, can be configured further or are
        # started in user sessions.
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };

        virt-manager.enable = true; # vm
    };

    environment = {
        sessionVariables.NIXOS_OZONE_WL = "1";
        variables = {
            BARTIB_FILE = "/home/dara/.local/share/bartib/2026.bartib";
            EDITOR = "nvim";
            LEDGER_FILE="/home/dara/Documents/accounts/2025.journal";

            # Use bat for highighted manual
            MANPAGER="sh -c 'col -bx | bat -l man -p'";
            MANROFFOPT="-c";
        };
    };

    xdg.mime.defaultApplications = {
        "default-web-browser" = "firefox.desktop";
    };

    nixpkgs = {
        # Allow unfree packages
        config.allowUnfree = true;

        # Add media controls to mpv so KDE Connect works, and make the UI nicer
        overlays = [
            (self: super: {
                mpv = super.mpv.override {
                    scripts = [ self.mpvScripts.mpris self.mpvScripts.modernx ];
                };
            })
        ];
    };

    hardware.bluetooth.enable = true; # noctalia asked for this

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "24.05"; # Did you read the comment?
}
