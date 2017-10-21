export LESSCHARSET='utf-8'
export LESS='-R'
export GOPATH="$HOME"
export GOBIN="$GOPATH/bin"
export GNUPGHOME="$HOME/.gnupg"
export ZPLUG_HOME="$HOME/bin/.zplug"
export PATH="$PATH:$HOME/bin"
export N_PREFIX="$HOME/bin/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
