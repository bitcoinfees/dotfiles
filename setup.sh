ln -s $PWD/.bashtools $HOME/.bashtools
ln -s $PWD/.inputrc $HOME/.inputrc

if [ -d $HOME/.vim ]
then
    echo "Warning, ~/.vim already exists."
else
    ln -s $PWD/.vim $HOME/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    mkdir ~/.vim/backup
    mkdir ~/.vim/undodir
fi

# Check if vim has +lua, needed for neocomplete
if ! vim --version | grep " +lua "
then
    echo "vim needs +lua, use vim-nox for linux or brew install --with-lua for OS X."
else
    vim +PluginInstall +qa
fi
