#!/bin/bash
# link files to user directory

# link vim files
if [[ -h ~/.vim ]]; then
    unlink ~/.vim
fi
ln -sf "$PWD/vim" ~/.vim
ln -sf "$PWD/vim/vimrc" ~/.vimrc

# link bash files
ln -sf "$PWD/bash/bash_profile" ~/.bash_profile

# link z.sh files
ln -sf "$PWD/z/z.sh" ~/.z.sh

# link tmux config files
ln -sf "$PWD/tmux.conf" ~/.tmux.conf

# source new bash profile
source ~/.bash_profile

