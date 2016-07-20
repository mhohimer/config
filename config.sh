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

# vim setup
if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
fi
ln -srf $CONFIG_DIR/.vimrc ~/.vimrc
vim -c "PluginInstall" -c "q | q"
cp $CONFIG_DIR/vim/wombat256mod.vim $HOME/.vim/bundle/vim-airline-themes/autoload/airline/themes/

# vim airline (fonts from powerline)
# using airline instead of powerline
#pip install --user powerline-status
wget -nc -P $CONFIG_DIR \
    https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf \
    #https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf \

# the above PowerlineSymbols.otf isn't as pixel perfect as the one below (which still isn't entirely perfect)
wget -nc -P $CONFIG_DIR \
    https://gist.github.com/EvanPurkhiser/6198795/raw/4bcf54ab069639d48893c45da71b6a79a8203f4d/PowerlineSymbols.otf

mkdir -p ~/.fonts/
cp $CONFIG_DIR/PowerlineSymbols.otf ~/.fonts/
cp $CONFIG_DIR/Ubuntu\ Mono\ derivative\ Powerline.ttf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/
cp $CONFIG_DIR/10-powerline-symbols.conf ~/.config/fontconfig/conf.d

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

