for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && . "$file"
done

# see http://zsh.sourceforge.net/Doc/Release/User-Contributions.html
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
zstyle ':completion:*' list-colors di=34 fi=0

# see http://zsh.sourceforge.net/Doc/Release/Options.html
setopt print_eight_bit
setopt interactive_comments
setopt prompt_subst
setopt transient_rprompt
setopt correct
setopt mark_dirs
setopt auto_param_slash
setopt auto_cd
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
setopt hist_expand
setopt inc_append_history

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=50000

source $ZPLUG_HOME/init.zsh

zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*linux_amd64*"
zplug "peco/peco", as:command, from:gh-r, use:"*linux_amd64*"
zplug "mrowa44/emojify", as:command

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "mollifier/cd-gitroot"
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"
zplug "b4b4r07/enhancd", use:enhancd.sh

if ! zplug check; then
    zplug install
fi

if zplug check "zsh-users/zsh-history-substring-search"; then
    bindkey "^P" history-substring-search-up
    bindkey "^N" history-substring-search-down
fi

zplug load

# the Clover to your prompt
PROMPT='
%F{green}🍀%f %F{cyan}%~%f '

# git
autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "+"
zstyle ":vcs_info:git:*" unstagedstr "-"
zstyle ":vcs_info:git:*" formats "%F{yellow}[%b]%f%F{red}%u%f%F{cyan}%c%f "
zstyle ":vcs_info:git:*" actionformats "%F{yellow}[%b|%a]%f%F{red}%u%f%F{cyan}%c%f"
precmd() { vcs_info }
PROMPT=$PROMPT'${vcs_info_msg_0_}
%# '

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i


export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
