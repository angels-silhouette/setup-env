# ensure nessesary programs are installed
if ! command -v git &> /dev/null
then
    echo "git not found"
    exit 1
fi

git clone --filter=blob:none git@github.com:ryanoasis/nerd-fonts ~/fonts/nerd-fonts
~/fonts/nerd-fonts/install.sh

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

git clone https://github.com/angels-silhouette/htop ~/.config/htop
git clone https://github.com/angels-silhouette/tmux ~/.config/tmux
git clone https://github.com/angels-silhouette/nvim ~/.config/nvim
