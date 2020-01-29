URL_FONT=https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/InconsolataGo/Regular/complete/InconsolataGo%20Nerd%20Font%20Complete%20Mono.ttf
DST_FONT=/usr/local/share/fonts/InconsolataGo-Nerd-Font-Complete-Mono.ttf
DIFF_URL=https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy

.PHONY: git tmux
install: font system vim
	stow -t $$HOME bash
	stow -t $$HOME pylint
	stow -t $$HOME xterm
	stow -t $$HOME yapf

font: ${DST_FONT}
${DST_FONT}:
	sudo curl ${URL_FONT} -o ${DST_FONT}
	fc-cache -f -v

install_utils: git tmux
	sudo apt install htop tree 

tmux: 
	sudo apt install tmux
	stow -t $$HOME tmux

git: 
	sudo apt install git
	curl ${DIFF_URL} -o ~/.local/bin/diff-so-fancy
	chmod +x ~/.local/bin/diff-so-fancy
	stow -t $$HOME git

neovim_install:
	# Install neovim by downloading the appimage from Github
	# Install the python-neovim package

# Customize zsh
neovim_setup:
	# Install the plugins
	# Copy my configuration file
	stow -t $$HOME nvim

vim:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	stow -t $$HOME vim

#system:
#	stow -t $$HOME system
#	update-mime-database ~/.local/share/mime

OH_MY_ZSH_URL=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
zsh_install:
	sudo apt install zsh
	sh -c "$$(curl -fsSL ${OH_MY_ZSH_URL})"
	chsh
	echo "Logout to set the default shell to ZSH"

zsh_setup:
	stow -t $$HOME zsh


# ======================
# ======= kitty ========
# ======================
SRC_DIR=~/.local/src/
HARFBUZZ=harfbuzz-1.7.6
LIBPNG=libpng-1.6.34
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

# Lightweight configuration for a server
server:
	cp server/vimrc ~/.vimrc
	cp server/tmux.conf ~/.tmux.conf
	cp server/bashrc ~/.bashrc
	cp server/inputrc ~/.inputrc
	cp server/gitconfig ~/.gitconfig
	echo "You should now source ~/.bashrc to apply changes"
