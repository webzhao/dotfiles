#!/bin/bash
# link files to user directory

# link vim files
ln -sf "$PWD/vim" ~/.vim
ln -sf "$PWD/vim/vimrc" ~/.vimrc

# link bash files
ln -sf "$PWD/bash/bash_profile" ~/.bash_profile

# link z.sh files
ln -sf "$PWD/z/z.sh" ~/.z.sh

# source new bash profile
source ~/.bash_profile

