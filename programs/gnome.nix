{ pkgs, ...}:

with pkgs.lib.gvariant;

{
    environment.gnome.excludePackages = with pkgs; [
        decibels
        geary
        gnome-console
        gnome-tour
        simple-scan
    ];

    # GNOME configuration
    programs.dconf = {
        enable = true;
        profiles.user.databases = [
            {
                lockAll = true; # prevents overriding
                settings = {

                    "org/gnome/desktop/datetime" = {
                        automatic-timezone = true;
                    };

                    "org/gnome/desktop/interface" = {
                        clock-show-weekday = true;
                        enable-hot-corners = true;
                    };

                    "org/gnome/desktop/privacy" = {
                        remove-old-temp-files = true;
                    };

                    "org/gnome/desktop/session" = {
                        idle-delay = mkUint32 0;
                    };

                    # turn caps lock into Escape
                    "org/gnome/desktop" = {
                        input-sources = [ "terminate:ctrl_alt_bksp" "caps:escape" ];
                    };

                    "org/gnome/desktop/wm/preferences" = {
                        focus-mode = "mouse";
                    };

                    "org/gnome/desktop/peripherals/mouse" = {
                        natural-scroll = true;
                    };

                    "org/gnome/mutter" = {
                        dynamic-workspaces = true;
                        edge-tiling = false;
                    };

                    "org/gnome/shell" = {
                        "app-switcher/current-workspace-only" = false;

                        disable-user-extensions = false;
                        enabled-extensions = [
                            "appindicatorsupport@rgcjonas.gmail.com"
                            "dash-to-dock@micxgx.gmail.com"
                            "drive-menu@gnome-shell-extensions.gcampax.github.com"
                            "gsconnect@andyholmes.github.io"
                            "nightthemeswitcher@romainvigier.fr"
                        ];
                        favorite-apps = [
                            "org.gnome.Nautilus.desktop"
                            "firefox.desktop"
                            "thunderbird.desktop"
                            "anki.desktop"
                            "com.mitchellh.ghostty.desktop"
                            "org.gnome.Calendar.desktop"
                            "org.gnome.Settings.desktop"
                        ];
                    };

                    "org/gnome/shell/extensions/dash-to-dock" = {
                        apply-custom-theme = true;
                        background-opacity = 0.8;
                        custom-theme-shrink = true;
                        dash-max-icon-size = mkInt32 48;
                        dock-position = "BOTTOM";
                        extend-height = false;
                        height-fraction = 0.9;
                        hot-keys = false;
                        icon-size-fixed = false;
                        preferred-monitor = (mkInt32 (-2));
                        preferred-monitor-by-connector = "eDP-1";
                        preview-size-scale = 0.0;
                        show-apps-at-top = true;
                        show-mounts-network = true;
                    };

                    "org/gnome/shell/extensions/nightthemeswitcher/time" = {
                        manual-schedule = true;
                    };

                    "org/gnome/tweaks" = {
                        show-extensions-notice = false;
                    };

                    "system/locale" = {
                        region = "en_IE.UTF-8";
                    };

                    "org/gnome/settings-daemon/plugins/color" = {
                        night-light-enabled = true;
                        night-light-schedule-automatic = true;
                        night-light-temperature = mkUint32 4135;
                    };

                    "org/gnome/settings-daemon/plugins/media-keys" = {
                        custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
                        logout = ["<Shift><Super>e"];
                        screensaver = ["<Shift><Super>o"];
                        search = ["<Super>space"];
                        www = ["<Super>b"];
                    };

                    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
                        binding = "<Super>Return";
                        command = "ghostty";
                        name = "Launch terminal";
                    };

                    "org/gnome/desktop/wm/keybindings" = {
                        close = ["<Shift><Super>q"];
                        maximize = [ "<Super>Up" ];

                        # disables these so they don't clash with the search shortcut
                        minimize = mkEmptyArray (type.string);
                        switch-input-source = mkEmptyArray (type.string);
                        switch-input-source-backward = mkEmptyArray (type.string);

                        toggle-fullscreen = [ "<Super>f" ];
                    };
                };
            }
        ];
    };

    # Enable GNOME desktop
    services = {
        desktopManager.gnome.enable = true;
        displayManager.gdm.enable = true;
        gnome.evolution-data-server.enable = true; # noctalia
    };
}
