# ensure necessary programs are installed
necessary='git make cmake gcc'

for program in $necessary
do
    if ! command -v $program &> /dev/null
    then
        echo "$program not found"
        exit 1
    fi
done

# install font
git clone --filter=blob:none https://github.com/ryanoasis/nerd-fonts ~/fonts/nerd-fonts
~/fonts/nerd-fonts/install.sh

# install necessary stuff
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

mkdir ~/tools
cd ~/tools
# build neovim
git clone https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..

# install distrobox
git clone https://github.com/89luca89/distrobox.git
./distrobox/install

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

# aliases
echo '############ added by script ############' >> ~/.bash_aliases
echo '# ---------- quality of life ---------- #' >> ~/.bash_aliases
echo 'alias alias-edt="nvim ~/.bash_aliases"' >> ~/.bash_aliases
echo 'alias history="nvim ~/.bash_history"' >> ~/.bash_aliases
echo 'alias refresh="source ~/.bashrc"' >> ~/.bash_aliases
echo 'alias grep="grep --color=auto"' >> ~/.bash_aliases
echo 'alias l="ls -CF"' >> ~/.bash_aliases
echo 'alias ll="ls -la"' >> ~/.bash_aliases
echo 'alias ls="ls --color=auto"' >> ~/.bash_aliases
echo 'alias pub-ip="curl ident.me"' >> ~/.bash_aliases
echo '# ----------- building tools ---------- #' >> ~/.bash_aliases
echo 'alias build-nvim="cd ~/tools/neovim && git pull && make CMAKE_BUILD_TYPE=Release && sudo make install && cd"' >> ~/.bash_aliases
echo 'alias build-distrobox="cd ~/tools/distrobox && git pull && ./install && cd"' >> ~/.bash_aliases
echo '#########################################' >> ~/.bash_aliases
