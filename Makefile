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
	sudo curl ${URL_FONT} -o /usr/local/share/fonts/InconsolataGo-Nerd-Font-Complete-Mono.ttf
	fc-cache -f -v

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	stow -t $$HOME vim

system:
	stow -t $$HOME system
	update-mime-database ~/.local/share/mime
	sudo apt install xbacklight

.PHONY: kitty
kitty: $(SRC_DIR)/kitty

$(SRC_DIR)/kitty: $(SRC_DIR)/$(HARFBUZZ) $(SRC_DIR)/$(LIBPNG)
	sudo apt install \
		libxrandr-dev \
		libxinerama-dev \
		libxcursor-dev \
		libxkbcommon-x11-dev \
		libxkbcommon-dev
	git clone https://github.com/kovidgoyal/kitty $(SRC_DIR)/kitty
	bash scripts/install_kitty.sh $(SRC_DIR)/kitty


.PHONY: harfbuzz
harfbuzz: $(SRC_DIR)/$(HARFBUZZ)

$(SRC_DIR)/$(HARFBUZZ): $(SRC_DIR)
	sudo apt install \
		gtk-doc-tools \
		libfontconfig-dev \
		libfreetype6-dev \
		libglib2.0-dev \
		libcairo2-dev \
		libtool
	bash scripts/install_harfbuzz.sh $(SRC_DIR) $(HARFBUZZ)

.PHONY: libpng
libpng: $(SRC_DIR)/$(LIBPNG)

$(SRC_DIR)/$(LIBPNG): $(SRC_DIR)
	sudo apt install \
		libpng12-dev \
		zlib1g-dev
	bash scripts/install_libpng16.sh $(SRC_DIR) $(LIBPNG)

$(SRC_DIR):
	mkdir $(SRC_DIR)
