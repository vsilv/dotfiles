autoload -U colors && colors
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias ls='ls --color=auto'
source ~/.vim/.shell_prompt.sh
autoload -U compinit promptinit
autoload predict-on
autoload colors


#FZF
# source /etc/profile.d/fzf-extras.zsh

autoload -U zmv
# ZMV is pretty neat, just check out http://zshwiki.org/home/builtin/functions/zmv
# example: zmv -w 'Report - Page *.png' '$1.png'


compinit
promptinit

export EDITOR=vim

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# History search with up and down arrow keys
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

alias la='ls -la'


# Git aliases
alias ga='git add .'
alias gc='git commit -a '
alias gac='git add . ; git commit -am "une commit unnecessaire"'
alias gp='git push origin master'
alias gl='git pull origin master'
alias alert='aplay ~/Music/sounds/drop1.wav'

# shell
alias b='cd ..'

# SSH alias
#alias push='rsync -avz  -e  ssh --exclude "*.npy" ~/ba/program/server/* fr_vk27@bwunicluster.scc.kit.edu:programs/'
#alias get='rsync -avz -e ssh --exclude "*.npy" fr_vk27@bwunicluster.scc.kit.edu:programs/ ~/ba/program/server/'
alias into='ssh -X fr_vk27@bwunicluster.scc.kit.edu'

# python
alias ipy='ipython notebook'

alias ijulia=ipython console --kernel julia-0.4

# pacman / yaourt
alias yasu='yaourt --sucre'

# general
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias rm='rm -I'

# tmux
alias tu="tmux resize-pane -D 20"

# vim
alias vim='vim --servername vim'
