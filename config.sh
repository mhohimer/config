#!/bin/bash
# Ubuntu configuration script

# The directory of this script
CONFIG_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#sudo apt-get update

sudo apt-get --assume-yes install \
	vim \
    tmux \
    sox \
	git \
	python-pip \
	virtualenv \

mkdir -p ~/bin

# noise gen script
wget -nc -P $CONFIG_DIR https://gist.githubusercontent.com/mhohimer/eace0653a8060b8e19cf3325c2d5d142/raw/867c9f5f9e97c06c551999164a4550a8de930227/noise.sh
chmod a+x noise.sh
ln -srf $CONFIG_DIR/noise.sh ~/bin/noise.sh

# gnome-terminal setup
gsettings set org.gnome.desktop.interface cursor-blink false

# vim setup
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -srf $COFIG_DIR/.vimrc ~/.vimrc

# tmux setup
ln -srf $CONFIG_DIR/.tmux.conf ~/.tmux.conf

# bash setup
BASHRC=~/.bashrc
if ! grep -qe "^# mhohimer config" $BASHRC; then
    echo "" >> $BASHRC
    echo "# mhohimer config" >> $BASHRC
    echo "." $CONFIG_DIR/.bashrc >> $BASHRC
    echo $BASHRC "modified, need to run:"
    echo "    source" $BASHRC
fi
