source ~/.zplug/zplug

zplug "zsh-users/zsh-history-substring-search", do:"__zsh_version 4.3"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10
zplug "junegunn/fzf-bin", as:command, from:gh-r, file:fzf, of:"*linux_amd64*"
zplug "peco/peco", as:command, from:gh-r, of:"*linux_amd64*"
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/enhancd", of:enhancd.sh

if ! zplug check; then
    zplug install
fi

zplug load
