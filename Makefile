# Get the directory of the Makefile
MKFILE_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: tmux xterm
install: font system install_utils
	stow -t $$HOME bash

install_utils: git tmux
	sudo apt install curl htop tree

tmux:
	sudo apt install tmux
	stow -t $$HOME tmux

DIFF_URL=https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
git: ~/.local/bin/diff-so-fancy
	stow -t $$HOME git
~/.local/bin/diff-so-fancy:
	sudo apt install git
	curl ${DIFF_URL} -o ~/.local/bin/diff-so-fancy
	chmod +x ~/.local/bin/diff-so-fancy

# Set up the font and colors for xterm
DST_FONT=/usr/local/share/fonts/InconsolataGo-Nerd-Font-Complete-Mono.ttf
xterm: xterm/Xresources.generated ${DST_FONT}
	ln -s $(shell pwd)/xterm/Xresources.generated ~/.Xresources-$(shell hostname)
	stow -t $$HOME xterm

xterm/Xresources.generated:
	sudo apt install xterm
	DOT_DIR=$(shell pwd) envsubst < xterm/Xresources > xterm/Xresources.generated

URL_FONT=https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/patched-fonts/InconsolataGo/Regular/complete/InconsolataGo%20Nerd%20Font%20Complete%20Mono.ttf
font: ${DST_FONT}
${DST_FONT}:
	sudo curl ${URL_FONT} -o ${DST_FONT}
	fc-cache -f -v

# Htop for the GPU
nvtop:
	sudo apt install cmake libncurses5-dev libncursesw5-dev git
	git clone https://github.com/Syllo/nvtop.git ~/.local/src/nvtop
	mkdir -p ~/.local/src/nvtop/build
	cd ~/.local/src/nvtop/build && cmake ..
	make -C ~/.local/src/nvtop/build
	sudo make -C ~/.local/src/nvtop/build install


# ======================
# =======  ZSH  ========
# ======================
# Customize zsh
OH_MY_ZSH_URL=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
zsh_install:
	sudo apt install zsh
	sh -c "$$(curl -fsSL ${OH_MY_ZSH_URL})"
	chsh
	echo "Logout to set the default shell to ZSH"

zsh_setup:
	stow -t $$HOME zsh


# ======================
# =======  Vim  ========
# ======================
neovim: ~/.local/bin/nvim neovim_setup neovim_config

NVIM_URL=https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
~/.local/bin/nvim:
	# Install neovim by downloading the appimage from Github
	curl -L ${NVIM_URL} -o $@
	chmod u+x $@

VIM_PLUG_URL=https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
neovim_setup:
	# Install the python-neovim package
	sudo apt install python3-neovim neovim- neovim-runtime-
	# Install VimPlug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs ${VIM_PLUG_URL}

neovim_config:
	ln -s ${MKFILE_DIR}/vim-clean/neovim-entrypoint/init.vim $$HOME/.config/nvim/init.vim
	mkdir $$HOME/.vim-clean
	stow -t $$HOME/.vim/ -d vim-clean vim

# ======================
# ====== Python ========
# ======================
#python:
	#stow -t $$HOME pylint
	#stow -t $$HOME yapf
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
