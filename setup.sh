# install necessary stuff
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

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
echo '#########################################' >> ~/.bash_aliases
