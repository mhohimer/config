if [ -f "$HOME/.profile" ]; then
    source "$HOME/.profile"
fi

# map caps lock key to ctrl when held...
setxkbmap -option 'caps:ctrl_modifier'
# and to escape when tapped
if [ -z "$(pgrep xcape)" ]; then
    xcape -e 'Caps_Lock=Escape'
fi
