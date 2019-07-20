# zmodload zsh/zprof

# Env variables
[ -f ~/.zsh/env ] && . ~/.zsh/env

# Aliases
[ -f ~/.zsh/aliases ] && . ~/.zsh/aliases

plugins=(git ruby rails bundler fast-syntax-highlighting z jira)

. $ZSH/oh-my-zsh.sh

. ~/.bash_profile

# Powerline
powerline-daemon -q
. $HOME/Library/Python/3.6/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# FZF searcher
[ -f ~/.fzf.zsh ] && . ~/.fzf.zsh

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

eval "$(rbenv init - --no-rehash)"
# zprof
