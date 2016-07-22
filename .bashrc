# this is source by ~/.bashrc

export PATH=$PATH:$HOME/bin

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR=vim

# virtualenvwrapper
export WORKON_HOME=$HOME/envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# map caps lock key to ctrl when held...
setxkbmap -option 'caps:ctrl_modifier'
# and to escape when tapped
xcape -e 'Caps_Lock=Escape'
