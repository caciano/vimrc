# Vim/NeoVim configuration file</h1>
This is my vim/neovim configuration file. Feel free to use, copy, change and redistribute. The installation process below is for Linux Mint 20.2 and can be adapted to other platforms.

## Requirements for Linux Mint 20.2

```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get install neovim vim.nox git build-essential cmake bat fzf universal-ctags python3-dev python3-jedi mono-complete golang default-jdk nodejs npm mate-terminal
```

## Choose your prefered editor
This configuration works better with neovim. If you want to set it as your default vi editor you can use the following update-alternatives commands.
```
sudo update-alternatives --config vi
sudo update-alternatives --config vim
sudo update-alternatives --config view
sudo update-alternatives --config vimdiff
```

## Devicons fonts
Install patched fonts from Devicons and configure mate-terminal to use a patched font (e.g. "Ubuntu Nerd Font Mono Regular").
```
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
./install.sh UbuntuMono
```

## Plug plugin manager
Install Plug plugin manager in ~/.vim directory.
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install vimrc file
Copy vimrc file to ~/.vimrc, start the editor, run :PlugUpdate and wait until the installation process is finished.

## Load .vimrc in NeoVim
```
mkdir .config/nvim
cat <<EOF > ~/.config/nvim/init.vim
set runtimepath^=~/.vim
let &packpath=&runtimepath
source ~/.vimrc
EOF
```
