#!/bin/bash

ln -s $PWD/bashtools $HOME/.bashtools
ln -s $PWD/inputrc $HOME/.inputrc
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/gitconfig $HOME/.gitconfig
ln -s $PWD/vimrc_private $HOME/.vimrc_private

if [ -d $HOME/.vim ]; then
    echo "~/.vim already exists."
else
    ln -s $PWD/vim $HOME/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    mkdir ~/.vim/backup
    mkdir ~/.vim/undodir
fi

# Check if tmux exists
if ! which tmux > /dev/null; then
    echo "You should install tmux."
fi

# Check if vim has +lua, needed for neocomplete
if ! vim --version | grep " +lua" > /dev/null; then
    echo "Vim needs +lua, use vim-nox for linux or brew install --with-lua for OS X."
else
    vim "+call FishPluginInstall()" +qa
fi

# Fish!
if ! which fish > /dev/null; then
    echo "Fish not installed; skipping"
else
    FISHBIN=$(which fish)
    if ! grep fish /etc/shells; then
        echo "Adding fish to /etc/shells"
        sudo echo $FISHBIN >> /etc/shells
    else
        echo "Fish found in /etc/shells"
    fi

    if ! [ $SHELL = $FISHBIN ]; then
        echo "Changing shell to fish, please enter password."
        chsh -s $FISHBIN
    fi

    FISHDIR=$HOME/.config/fish
    if [ -d $FISHDIR -a ! -L $FISHDIR ]; then
        echo "Fish dir already exists, moving it to ~/.config/fish.bak"
        mv $FISHDIR $FISHDIR.bak
    fi
    if ! [ -e $FISHDIR ]; then
        ln -s $PWD/fish $HOME/.config/fish
    fi

    touch fish/local.fish
    git submodule update --init fish/fishmarks
fi
