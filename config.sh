#!/bin/bash -ex
# Ubuntu configuration script

# The directory of this script
CONFIG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get update

sudo apt-get --assume-yes install \
    git \
    tmux \
    vim-gnome \  # only vim-gnome, vim-gtk, etc. are compiled with clipboard and xtermclipboard features compiled in
    cmake \  # for youcompleteme vim plugin
    sox \
    htop\
    xcape \
    gconf-editor \
    python-dev \
    python3-pip \
    python3-dev \
    flake8 \
    python3-flake8 \
    virtualenv \
    cifs-utils \
    software-properties-common

ln -srf $CONFIG_DIR/bin ~

# gnome-terminal setup
gsettings set org.gnome.desktop.interface cursor-blink false
if [ ! -d "$CONFIG_DIR/gnome-terminal/colors" ]; then
    git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git \
        $CONFIG_DIR/gnome-terminal/colors
fi
ln -srf $CONFIG_DIR/gnome-terminal/wombat $CONFIG_DIR/gnome-terminal/colors/colors
ln -srf $CONFIG_DIR/gnome-terminal/tango $CONFIG_DIR/gnome-terminal/colors/colors
ln -srf $CONFIG_DIR/gnome-terminal/tango_mod $CONFIG_DIR/gnome-terminal/colors/colors
# XXX This profile is not created by default, you will probably need to create it
# and rerun this script, or we could programatically create a new profile and
# make it default. Using the "Unnamed" account doesn't work.
profile_name="Default"
$CONFIG_DIR/gnome-terminal/colors/install.sh -s tango_mod -p "$profile_name"

# tmux setup
ln -srf $CONFIG_DIR/.tmux.conf ~/.tmux.conf

# python setup
ln -srf $CONFIG_DIR/.flake8 ~/.flake8
ln -srf $CONFIG_DIR/.flake8 ~/.config/flake8

# bash setup
BASHRC=~/.bashrc
if ! grep -qe "^# mhohimer config" $BASHRC; then
    echo "" >> $BASHRC
    echo "# mhohimer config" >> $BASHRC
    echo "." $CONFIG_DIR/.bashrc >> $BASHRC
    echo $BASHRC "modified, need to run:"
    echo "    source" $BASHRC
fi

# .bash_profile setup
BASH_PROFILE=~/.bash_profile
if ! grep -qe "^# mhohimer config" $BASH_PROFILE ; then
    echo "" >> $BASH_PROFILE 
    echo "# mhohimer config" >> $BASH_PROFILE 
    echo "source $CONFIG_DIR/.bash_profile" >> $BASH_PROFILE 
    echo $BASH_PROFILE  "modified, need to log out and back in"
fi

# inputrc
ln -srf $CONFIG_DIR/.inputrc ~/.inputrc

# vim setup
if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
ln -srf $CONFIG_DIR/.vimrc ~/.vimrc
vim -c "PluginInstall" -c "q | q"
ln -srf $CONFIG_DIR/vim/airline/wombat256mod.vim $HOME/.vim/bundle/vim-airline-themes/autoload/airline/themes/

# vim airline (fonts from powerline)
# using airline instead of powerline
#pip install --user powerline-status
wget -nc -P $CONFIG_DIR \
    https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf \
    #https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf \

# the above PowerlineSymbols.otf isn't as pixel perfect as the one below (which still isn't entirely perfect)
wget -nc -P $CONFIG_DIR \
    https://gist.github.com/EvanPurkhiser/6198795/raw/4bcf54ab069639d48893c45da71b6a79a8203f4d/PowerlineSymbols.otf

# update wombat256mod colorscheme
if [ -e $HOME/.vim/bundle/wombat256.vim/colors/wombat256mod.vim.orig ]; then
    mv $HOME/.vim/bundle/wombat256.vim/colors/wombat256mod.vim.orig \
        $HOME/.vim/bundle/wombat256.vim/colors/wombat256mod.vim
fi
patch -b \
    $HOME/.vim/bundle/wombat256.vim/colors/wombat256mod.vim \
    $CONFIG_DIR/vim/wombat256mod.vim.patch


mkdir -p ~/.fonts/
cp $CONFIG_DIR/PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/
cp $CONFIG_DIR/10-powerline-symbols.conf ~/.config/fontconfig/conf.d

