URL_FONT=https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/InconsolataGo/Regular/complete/InconsolataGo%20Nerd%20Font%20Complete%20Mono.ttf

install: font system vim
	stow -t $$HOME bash
	stow -t $$HOME git
	stow -t $$HOME i3
	stow -t $$HOME nvim
	stow -t $$HOME pylint
	stow -t $$HOME tmux
	stow -t $$HOME xterm
	stow -t $$HOME yapf

font:
	sudo curl ${URL_FONT} -o /usr/local/share/fonts/InconsolataGo-Nerd-Font-Complete-Mono.ttf
	fc-cache -f -v

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	stow -t $$HOME vim

system:
	stow -t $$HOME system
	update-mime-database ~/.local/share/mime
	sudo apt install xbacklight
