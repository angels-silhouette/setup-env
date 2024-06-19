# ensure necessary programs are installed
if ! command -v git &> /dev/null
then
    echo "git not found"
    exit 1
elif ! command -v make &> /dev/null
then
    echo "make not found"
    exit 1
fi

# install font
git clone --filter=blob:none git@github.com:ryanoasis/nerd-fonts ~/fonts/nerd-fonts
~/fonts/nerd-fonts/install.sh

# install necessary stuff
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# build neovim
cd 
git clone https://github.com/neovim/neovim.git
make CMAKE_BUILD_TYPE=Release
sudo make install

# add configs
git clone https://github.com/angels-silhouette/htop ~/.config/htop
git clone https://github.com/angels-silhouette/tmux ~/.config/tmux
git clone https://github.com/angels-silhouette/nvim ~/.config/nvim

# allow for adding aliases
echo '# ---------- added by script ---------- #' >> ~/.bashrc
echo 'if [ -f ~/.bash_aliases ]; then' >> ~/.bashrc
echo '    . ~/.bash_aliases' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo '# ------------------------------------- #' >> ~/.bashrc

# bash
echo '# ---------- added by script ---------- #' >> ~/.bash_aliases
echo 'alias alias-edt="nvim ~/.bash_aliases"' >> ~/.bash_aliases
echo 'alias history="nvim ~/.bash_history"' >> ~/.bash_aliases
echo 'alias refresh="source ~/.bashrc"' >> ~/.bash_aliases
echo '# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #' >> ~/.bash_aliases

# LaTeX aliases
echo 'alias build="latexmk -pdflua --output-directory=build"' >> ~/.bash_aliases
echo 'alias delete="rm -rf ./build"' >> ~/.bash_aliases
echo '# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #' >> ~/.bash_aliases

# quality of life aliases
echo 'alias grep="grep --color=auto"' >> ~/.bash_aliases
echo 'alias l="ls -CF"' >> ~/.bash_aliases
echo 'alias ll="ls -la"' >> ~/.bash_aliases
echo 'alias ls="ls --color=auto"' >> ~/.bash_aliases
echo 'alias pub-ip="curl ident.me"' >> ~/.bash_aliases
echo '# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ #' >> ~/.bash_aliases

# neovim aliases
echo 'alias build-nvim="cd ~/neovim && git pull && make CMAKE_BUILD_TYPE=Release && sudo make install && cd"' >> ~/.bash_aliases
echo '# ------------------------------------- #' >> ~/.bash_aliases
