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

# modify files/dirs marked world writable to remove green background,
# specifically hgfs mounted directories
export LS_COLORS="$LS_COLORS:ow=34;01:"
