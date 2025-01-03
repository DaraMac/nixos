{ config, pkgs, ...}:

{	
	# Home Manager needs a bit of information about you and the
	# paths it should manage.
	home.username = "dara";
	home.homeDirectory = "/home/dara";

	# This value determines the Home Manager release that your
	# configuration is compatible with. This helps avoid breakage
	# when a new Home Manager releases introduces backwards
	# incompatible changes.
	#
	# You can update Home Manager without changing this value. See
	# the Home Manager releases notes for a list of state version
	# changes in each release.
	home.stateVersion = "25.05";

	programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		userEmail = "DaraMac@users.noreply.github.com";
		userName  = "dmac";
		extraConfig = {
			core.editor = "nvim";
			diff.algorithm = "histogram";
			init.defaultBranch = "main";
			log.date = "iso";
			merge.conflictstyle = "diff3";
			pull.rebase = "true";
			push.autoSetupRemote = "true";
		};
	};

	programs.zsh = {
		# enable = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		oh-my-zsh.enable = true;
	};
}
