install: system vim
	stow -t $$HOME bash
	stow -t $$HOME git
	stow -t $$HOME nvim
	stow -t $$HOME pylint
	stow -t $$HOME tmux
	stow -t $$HOME yapf
	stow -t $$HOME xterm
	stow -t $$HOME i3

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	stow -t $$HOME vim

system:
	stow -t $$HOME system
	update-mime-database ~/.local/share/mime
