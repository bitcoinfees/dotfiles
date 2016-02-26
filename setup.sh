#!/bin/sh

ln -s $PWD/.bashtools $HOME/.bashtools
ln -s $PWD/.inputrc $HOME/.inputrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/.gitconfig $HOME/.gitconfig

if [ -d $HOME/.vim ]
then
    echo "~/.vim already exists."
else
    ln -s $PWD/.vim $HOME/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    mkdir ~/.vim/backup
    mkdir ~/.vim/undodir
fi

# Check if tmux exists
if ! which tmux > /dev/null
then
    echo "You should install tmux."
fi

# Check if vim has +lua, needed for neocomplete
if ! vim --version | grep " +lua " > /dev/null
then
    echo "Vim needs +lua, use vim-nox for linux or brew install --with-lua for OS X."
else
    vim +PluginInstall +qa
fi

# Fish!
if ! which fish > /dev/null
then
    echo "You need to install fish."
else
    FISHFILE=$(which fish)
    if ! grep fish /etc/shells
    then
        echo "Adding fish to /etc/shells"
        sudo echo $FISHFILE >> /etc/shells
    else
        echo "Fish found in /etc/shells"
    fi
    if ! [ $SHELL == $FISHFILE ]
    then
        chsh -s $FISHFILE
    fi
fi

if [ -d $HOME/.config/fish ]
then
    echo "$HOME/.config/fish already exists."
else
    ln -s $PWD/fish $HOME/.config/fish
fi
