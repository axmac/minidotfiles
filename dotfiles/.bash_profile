# Load the shell dotfiles:
# * ~/.path can be used to extend `$PATH`.
for file in ~/.{bash_completion,path,exports,functions,aliases,extra,bash_prompt,fzf.bash}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

ulimit -n 1024

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Allow ctrl+s to search forward through history
stty -ixon

# Git prompt
export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PROMPT_FETCH_REMOTE_STATUS=0
export GIT_PROMPT_START="$BASH_PROMPT"
if [[ -f ~/.bash-git-prompt/gitprompt.sh ]]; then
    source ~/.bash-git-prompt/gitprompt.sh
fi

# SSH agent
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
    /usr/bin/ssh-add ~/.ssh/puppet
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
