if [ -f /proc/$PPID/cmdline ]; then
  if [ "$(command cut -d : -f1 < "/proc/$PPID/cmdline")" = "sshd" ] && [[ $- == *i* ]]; then
    echo
    command df -h | command awk '/^\/dev/ {gsub(/.[890][0-9]%/, "\x1b[1;31m&\x1b[0m"); print;}'
    echo
    command free -m
  fi
else
  ps | grep ssh-agent > /dev/null
  if [ "$?" -eq 0 ] && [ -f ~/.ssh-agent ]; then
    . ~/.ssh-agent
  else
    ssh-agent > ~/.ssh-agent
    . ~/.ssh-agent
    ssh-add ~/.ssh/id_github
  fi
fi
