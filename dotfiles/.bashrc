if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

[ -n "$PS1" ] && source ~/.bash_profile

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
