{ pkgs, ...}:

{
	programs = {
		firefox = {
			enable = true;
			nativeMessagingHosts.packages = with pkgs; [passff-host];
			policies = {
				ExtensionSettings = {
					# uBlock Origin
					"uBlock0@raymondhill.net" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
						installation_mode = "force_installed";
					};
					# NoScript
					"{73a6fe31-595d-460b-a920-fcc0f8843232}" = {
						install_url = "https://addons.mozilla.org/firefox/downloads/file/4379558/noscript-11.5.2.xpi";
						installation_mode = "force_installed";
					};
				};
			};
		};
	};
}

