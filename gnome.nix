{ pkgs, ...}:

with pkgs.lib.gvariant;

{
    # Enable GNOME desktop
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;


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
                # lockAll = true; # prevents overriding
                lockAll = false; # enable overriding while testing settings
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
                            "auto-accent-colour@Wartybix"
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
			logout = ["<Shift><Super>e"];
			screensaver = ["<Shift><Super>o"];
                    };

		    # /org/gnome/desktop/wm/keybindings/minimize this is <Super>h, so need to clear

		    "org/gnome/desktop/wm/keybindings" = {
		        # disable these so they don't clash with the search shortcut
		    	switch-input-source = pkgs.lib.gvariant.mkEmptyArray (pkgs.lib.gvariant.type.string);
			switch-input-source-backward = pkgs.lib.gvariant.mkEmptyArray (pkgs.lib.gvariant.type.string);
			close = ["<Shift><Super>q"];
		    };
                };
            }
        ];
    };
}
