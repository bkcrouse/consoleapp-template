# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$HOME/scripts:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# handle the crazy trax-console artifact top-level zip name and strip it
#
unzip-strip() (
    local zip=$1
    local dest=${2:-.}
    local temp=$(mktemp -d) && unzip -d "$temp" "$zip" && mkdir -p "$dest" &&
    shopt -s dotglob && local f=("$temp"/*) &&
    if (( ${#f[@]} == 1 )) && [[ -d "${f[0]}" ]] ; then
        mv "$temp"/*/* "$dest"
    else
        mv "$temp"/* "$dest"
    fi && rmdir "$temp"/* "$temp"
)
