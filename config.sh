#!/bin/bash
# Ubuntu configuration script

sudo apt-get update

sudo apt-get install \
	vim \
	git \
	python-pip \
	virtualenv \

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

ln -srf .vimrc ~/.vimrc
