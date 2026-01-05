#!/bin/bash
git config --global user.name "Jotaro Emoto"
git config --global user.email ""
apt install git-lfs
git lfs install

# homebrewのインストール
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >>/root/.bashrc
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >>/root/.bashrc
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# neovim → lazyvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
rm -rf /opt/nvim-linux-x86_64
tar -C /opt -xzf nvim-linux-x86_64.tar.gz
echo export PATH="$PATH:/opt/nvim-linux-x86_64/bin" >>~/.bashrc

/bin/bash -c "$(mv ~/.config/nvim{,.bak})"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# treesitter-cli
brew install tree-sitter-cli

git clone git@github.com:SiRoZaRuPa/dotfiles.git
