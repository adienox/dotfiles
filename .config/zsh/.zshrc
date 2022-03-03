# Starts shell inside a tmux session
#if [ -z $TMUX ] && [ -z $SKIP_TMUX ]; then
#  unused_sessions=$(tmux ls -F "#{session_attached},#{session_id}" | awk -F , '{if ($1 ~ /^0/) print $2}' | sort --numeric | head --lines 1)
#  if [ -z $unused_sessions ]; then
#    exec tmux new-session
#  else
#    exec tmux attach-session -t $unused_sessions
#  fi
#fi

zstyle ':completion:*' rehash true

export ALPHAVANTAGE_API_KEY=YLN1UT70QHW2OGPL

# History
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE=~/.cache/zsh/history

setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

# Tab completion
autoload -U compinit; compinit
zstyle ':completion:*' menu select
_comp_options+=(globdots)

# Syntar highlighting
source ~/.config/zsh/fsh/fast-syntax-highlighting.plugin.zsh

# rpg dungeon
#alias rpg='rpg-cli'
#rpg-cd () {
#    cd "$@"
#    rpg-cli cd -f .
#    rpg-cli battle
#}
#rpg-ls () {
#	rpg-cli ls
#	exa -al --color=always --group-directories-first --icons
#}
#alias cd='rpg-cd'
#alias ls='rpg-ls'

# ls aliases
alias ls='exa -al --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles

# cd alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

#docker aliases
alias dps='docker ps -a'
alias dc='docker'
alias dci='docker images'
alias dcp='docker container prune'

# git alias
alias gc="git commit -m"
alias ga="git add"
alias gp="git push"
alias gs="git status"

# Debug alias
alias objdump='objdump -M intel -D'

# Useful aliases
alias sudo='sudo '
alias yt-audio='yt-dlp -x --audio-format mp3 --audio-quality 0'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'
alias wttr='curl "https://wttr.in/charpane?F0"'
alias v='nvim'
alias cat='bat --style header --style rules --style snip --style changes --style header'
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias grep='grep --color=auto'
alias hw='hwinfo --short'
alias tb='nc termbin.com 9999'
alias zc='v $HOME/.config/zsh/.zshrc'
alias spotdl='spotdl --use-youtube'
alias ipa="ip --brief address"

# Add local bin path if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# Add doom-emacs bin path if exists
if [ -d "$HOME/.emacs.d/bin" ] ; then
    PATH="$HOME/.emacs.d/bin:$PATH"
fi

# runs pfetch if shell is interactive
if [[ $- == *i* ]] ; then
	cfetch
fi

eval "$(starship init zsh)"
