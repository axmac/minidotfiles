##########
#
# If using ZSH shell, refer to .zsh_profile.
#
##########

if [ -e ~/.oh-my-zsh ]; then
  if [ -t 1 ]; then
    exec zsh
  fi
fi

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
    if [ -f ~/.ssh/puppet ]; then
      /usr/bin/ssh-add ~/.ssh/puppet
    fi
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps ${SSH_AGENT_PID} > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

if [ -d "$HOME/.rbenv/bin" ]; then
    eval "$(rbenv init -)"
fi
export PATH="$HOME/.rbenv/bin:$PATH"
