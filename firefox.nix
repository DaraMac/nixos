{ pkgs, ...}:

{
	programs = {
		firefox = {
			enable = true;
			nativeMessagingHosts.packages = with pkgs; [passff-host];
			policies = {

				EnableTrackingProtection = {
					Value= true;
					Locked = true;
					Cryptomining = true;
					Fingerprinting = true;
					EmailTracking = true;
				};
				DisablePocket = true;
				DisplayBookmarksToolbar = "never";
				SearchBar = "separate";
				NewTabPage = "false";

				Homepage = {
					StartPage = "previous-session";
				};

				ExtensionSettings = {
					# uBlock Origin
					"uBlock0@raymondhill.net" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
						installation_mode = "force_installed";
					};

					# NoScript
					"{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/noscript/latest.xpi";
						installation_mode = "force_installed";
					};

					# BetterTTV
					"firefox@betterttv.net" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/betterttv/latest.xpi";
						installation_mode = "force_installed";
					};

					# PassFF
					"passff@invicem.pro" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/passff/latest.xpi";
						installation_mode = "force_installed";
					};

					# Tridactyl
					"tridactyl.vim@cmcaine.co.uk" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/tridactyl-vim/latest.xpi";
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
			};
		};
	};
}

