install: system
	stow -t $$HOME bash
	stow -t $$HOME git
	stow -t $$HOME nvim
	stow -t $$HOME pylint
	stow -t $$HOME tmux
	stow -t $$HOME vim
	stow -t $$HOME yapf
	stow -t $$HOME xterm

system:
	stow -t $$HOME system
	update-mime-database ~/.local/share/mime
