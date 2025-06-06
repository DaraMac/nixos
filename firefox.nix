{ pkgs, ...}:

{
    programs = {
        firefox = {
            enable = true;
            policies = {
                DisablePocket = true;
                DisplayBookmarksToolbar = "never";
                EnableTrackingProtection = {
                    Cryptomining   = true;
                    EmailTracking  = true;
                    Fingerprinting = true;
                    Locked         = true;
                    Value          = true;
                };
                ExtensionSettings = {
                    # BetterTTV
                    "firefox@betterttv.net" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/betterttv/latest.xpi";
                        installation_mode = "force_installed";
                    };

                    # LeechBlock NG
                    "leechblockng@proginosko.com" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/leechblock-ng/latest.xpi";
                        installation_mode = "force_installed";
                    };

                    # NoScript
                    "{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/noscript/latest.xpi";
                        installation_mode = "force_installed";
                    };

                    # PassFF
                    "passff@invicem.pro" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/passff/latest.xpi";
                        installation_mode = "force_installed";
                    };

                    # Stylus
                    "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
                        installation_mode = "force_installed";
                    };

                    # Tridactyl
                    "tridactyl.vim@cmcaine.co.uk" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
                        installation_mode = "force_installed";
                    };

                    # uBlock Origin
                    "uBlock0@raymondhill.net" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
                        installation_mode = "force_installed";
                    };

                    # Unhook
                    "myallychou@gmail.com" = {
                        install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-recommended-videos/latest.xpi";
                        installation_mode = "force_installed";
                    };

                    # Zotero Connector
                    "zotero@chnm.gmu.edu" = {
                        install_url = "https://www.zotero.org/download/connector/dl?browser=firefox";
                        installation_mode = "force_installed";
                    };
                };
                Homepage.StartPage = "previous-session";
                NewTabPage = "false";
                SearchBar = "separate";
            };
            nativeMessagingHosts.packages = with pkgs; [passff-host];
        };
    };
}
