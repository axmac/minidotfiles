# Load the shell dotfiles:
# * ~/.path can be used to extend `$PATH`.
for file in ~/.{path,bash_prompt,exports,functions,aliases,extra}; do
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

# Add tab completion for more commands
## OSX
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# Centos/jump host
if [[ -f /etc/bash_completion.d/git ]]; then
    source /etc/bash_completion.d/git
fi

if [[ -f /opt/graviton/graviton-cli-current/bin/graviton-completion.bash ]]; then
    source /opt/graviton/graviton-cli-current/bin/graviton-completion.bash
fi

if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
    source /usr/share/git-core/contrib/completion/git-prompt.sh
fi
