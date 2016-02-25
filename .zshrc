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

# the Clover to your prompt
PROMPT='%F{green}🍀%f %F{cyan}%~%f '

# git
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
zstyle ':vcs_info:git:*' formats '%F{yellow}[%b]%f%F{red}%u%f%F{cyan}%c%f '
zstyle ':vcs_info:git:*' actionformats '%F{yellow}[%b|%a]%f%F{red}%u%f%F{cyan}%c%f'
precmd() { vcs_info }
PROMPT=$PROMPT'${vcs_info_msg_0_}'
