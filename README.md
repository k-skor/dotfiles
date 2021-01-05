# Install dotfiles
https://pl.atlassian.com/git/tutorials/dotfiles

    curl -Lks https://raw.githubusercontent.com/k-skor/dotfiles/master/dotfiles_init.sh | /bin/bash

# Prerequisites

    sudo apt-get install -y python3-pip neovim xclip

    pip3 install neovim pynvim powerline-status
    
    universal-ctags: https://github.com/universal-ctags/ctags/
    build: docs/autotools.rst

## * Before Ubuntu 18.04
    sudo add-apt-repository ppa:neovim-ppa/stable  
    sudo apt-get update

# Neovim vim-plug
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        
# Windows Terminal tweaks
## Font
    Cascadia Code PL: https://github.com/microsoft/cascadia-code
## Terminal settings:

Profile:

    {
        "guid": "{07b52e3e-de2c-5db4-bd2d-ba144ed6c273}",
        "hidden": false,
        "name": "Ubuntu-20.04",
        "source": "Windows.Terminal.Wsl",
        "colorScheme": "Ubuntu",
        "fontFace": "Cascadia Code PL",
        "fontSize": 10,
        "closeOnExit": "true",
    }

Actions:

    //{ "command": {"action": "copy", "singleLine": false }, "keys": "ctrl+c" },
    //{ "command": "paste", "keys": "ctrl+v" },

Keybindings:

    // Disable apps shortcuts
    { "command": null, "keys": ["ctrl+shift+6"] },
    { "command": null, "keys": ["F7"] },
