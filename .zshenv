export LESSCHARSET=utf-8
export LESS="-R"
export GOPATH=~/go
export GNUPGHOME=~/.gnupg
export ZPLUG_HOME=$HOME/.zplug
export PATH+=":~/.local/bin:~/bin:$ZPLUG_HOME:$GOPATH/bin"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
