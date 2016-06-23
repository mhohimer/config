#!/bin/bash
# Ubuntu configuration script

sudo apt-get update

sudo apt-get install \
	vim \
    tmux \
	git \
	python-pip \
	virtualenv \


# gnome-terminal setup
gsettings set org.gnome.desktop.interface cursor-blink false

# vim setup
#git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -srf .vimrc ~/.vimrc

# tmux setup
ln -srf .tmux.conf ~/.tmux.conf
