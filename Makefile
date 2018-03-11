URL_FONT=https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/InconsolataGo/Regular/complete/InconsolataGo%20Nerd%20Font%20Complete%20Mono.ttf
SRC_DIR=~/.local/src/
HARFBUZZ=harfbuzz-1.7.6
LIBPNG=libpng-1.6.34

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
	sudo curl ${URL_FONT} -o /usr/local/share/fonts/InconsolataGo-Bold-Nerd-Font-Complete-Mono.ttf
	fc-cache -f -v

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	stow -t $$HOME vim

system:
	stow -t $$HOME system
	update-mime-database ~/.local/share/mime
	sudo apt install xbacklight

kitty: $(SRC_DIR)/$(HARFBUZZ) $(SRC_DIR)/$(LIBPNG)
	sudo apt install \
		libpng12-dev \
		libxrandr-dev \
		libxinerama-dev \
		libxcursor-dev \
		libxkbcommon-dev

$(SRC_DIR)/$(HARFBUZZ): $(SRC_DIR)
	bash scripts/install_harfbuzz.sh $(SRC_DIR) $(HARFBUZZ)

$(SRC_DIR)/$(LIBPNG): $(SRC_DIR)
	bash scripts/install_libpng16.sh $(SRC_DIR) $(LIBPNG)

$(SRC_DIR):
	mkdir $(SRC_DIR)
