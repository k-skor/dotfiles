https://pl.atlassian.com/git/tutorials/dotfiles

    curl -Lks https://raw.githubusercontent.com/k-skor/dotfiles/master/dotfiles_init.sh | /bin/bash

# Before Ubuntu 18.04
    sudo add-apt-repository ppa:neovim-ppa/stable  
    sudo apt-get update

# Dependency
    sudo apt-get install -y python3-pip neovim xclip

    pip3 install neovim pynvim powerline-status
    
## ctags
universal-ctags: https://github.com/universal-ctags/ctags/ \
build: docs/autotools.rst

# Neovim vim-plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
