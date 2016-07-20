#!/bin/bash
# Ubuntu configuration script

# The directory of this script
CONFIG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#sudo apt-get update

sudo apt-get --assume-yes install \
    vim-gnome \
    tmux \
    sox \
    git \
    gconf-editor \
    python-pip \
    flake8 \
    python-flake8 \
    virtualenv \

ln -srf $CONFIG_DIR/bin ~

# noise gen script
wget -nc -P $CONFIG_DIR/bin https://gist.githubusercontent.com/mhohimer/eace0653a8060b8e19cf3325c2d5d142/raw/867c9f5f9e97c06c551999164a4550a8de930227/noise.sh
chmod a+x $CONFIG_DIR/bin/noise.sh
chmod go-w $CONFIG_DIR/bin/noise.sh

# gnome-terminal setup
gsettings set org.gnome.desktop.interface cursor-blink false
if [ ! -d "$CONFIG_DIR/gnome-terminal/colors" ]; then
    git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git \
        $CONFIG_DIR/gnome-terminal/colors
fi
ln -srf $CONFIG_DIR/gnome-terminal/wombat $CONFIG_DIR/gnome-terminal/colors/colors
profile_name="Unnamed"
# XXX The colors aren't right yet, don't invoke this command
#$CONFIG_DIR/gnome-terminal/colors/install.sh -s wombat -p "$profile_name"

# tmux setup
ln -srf $CONFIG_DIR/.tmux.conf ~/.tmux.conf

# python setup
ln -srf $CONFIG_DIR/.flake8 ~/.flake8

# bash setup
BASHRC=~/.bashrc
if ! grep -qe "^# mhohimer config" $BASHRC; then
    echo "" >> $BASHRC
    echo "# mhohimer config" >> $BASHRC
    echo "." $CONFIG_DIR/.bashrc >> $BASHRC
    echo $BASHRC "modified, need to run:"
    echo "    source" $BASHRC
fi

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

