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
						favorite-apps = [
								"org.gnome.Nautilus.desktop"
								"firefox.desktop"
								"thunderbird.desktop"
								"anki.desktop"
								"ghostty.desktop"
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

					"org/gnome/shell/extensions/auto-accent-colour" = {
						hide-indicator = true;
						highlight-mode = false;
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

					"org/gnome/shell/extensions/forge" = {
						dnd-center-layout = "swap";
						move-pointer-focus-enabled = true;
						quick-settings-enabled = false;
						stacked-tiling-mode-enabled = false;
						tabbed-tiling-mode-enabled = false;
						tiling-mode-enabled = true;
						window-gap-hidden-on-single = true;
					};

					"org/gnome/shell/extensions/forge/keybindings" = {
						con-split-horizontal = [ "<Super>z" ];
						con-split-layout-toggle = [ "<Super>g" ];
						con-split-vertical = [ "<Super>v" ];
						con-stacked-layout-toggle = [ "<Shift><Super>s" ];
						con-tabbed-layout-toggle = [ "<Shift><Super>t" ];
						con-tabbed-showtab-decoration-toggle = [ "<Control><Alt>y" ];
						focus-border-toggle = [ "<Super>x" ];
						prefs-tiling-toggle = [ "<Super>w" ];
						window-focus-down = [ "<Super>j" ];
						window-focus-left = [ "<Super>h" ];
						window-focus-right = [ "<Super>l" ];
						window-focus-up = [ "<Super>k" ];
						window-gap-size-decrease = [ "<Control><Super>minus" ];
						window-gap-size-increase = [ "<Control><Super>plus" ];
						window-move-down = [ "<Shift><Super>j" ];
						window-move-left = [ "<Shift><Super>h" ];
						window-move-right = [ "<Shift><Super>l" ];
						window-move-up = [ "<Shift><Super>k" ];
						window-resize-bottom-decrease = [ "<Shift><Control><Super>i" ];
						window-resize-bottom-increase = [ "<Control><Super>u" ];
						window-resize-left-decrease = [ "<Shift><Control><Super>o" ];
						window-resize-left-increase = [ "<Control><Super>y" ];
						window-resize-right-decrease = [ "<Shift><Control><Super>y" ];
						window-resize-right-increase = [ "<Control><Super>o" ];
						window-resize-top-decrease = [ "<Shift><Control><Super>u" ];
						window-resize-top-increase = [ "<Control><Super>i" ];
						window-snap-center = [ "<Control><Alt>c" ];
						window-snap-one-third-left = [ "<Control><Alt>d" ];
						window-snap-one-third-right = [ "<Control><Alt>g" ];
						window-snap-two-third-left = [ "<Control><Alt>e" ];
						window-snap-two-third-right = [ "<Control><Alt>t" ];
						window-swap-down = [ "<Control><Super>j" ];
						window-swap-last-active = mkEmptyArray (type.string);
						window-swap-left = [ "<Control><Super>h" ];
						window-swap-right = [ "<Control><Super>l" ];
						window-swap-up = [ "<Control><Super>k" ];
						window-toggle-always-float = [ "<Shift><Super>c" ];
						window-toggle-float = [ "<Super>c" ];
						workspace-active-tile-toggle = [ "<Shift><Super>w" ];
					};

					"org/gnome/shell/extensions/nightthemeswitcher/time" = {
						manual-schedule = true;
					};

					"org/gnome/shell/extensions/rounded-window-corners-reborn" = {
						settings-version = mkUint32 6;
						tweak-kitty-terminal = true;
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
						www = ["<Super>b"];
						search = ["<Super>space"];
						logout = ["<Shift><Super>e"];
						screensaver = ["<Shift><Super>o"];
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
}
