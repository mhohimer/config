# this is source by ~/.bashrc

export PATH=$PATH:$HOME/bin

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

export EDITOR=vim
