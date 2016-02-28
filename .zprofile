for file in ~/.{exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
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
