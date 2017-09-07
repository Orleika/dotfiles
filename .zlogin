ps | grep ssh-agent > /dev/null
if [ "$?" -eq 0 ] && [ -f ~/.ssh-agent ]; then
  . ~/.ssh-agent
else
  ssh-agent > ~/.ssh-agent
  . ~/.ssh-agent
  ssh-add ~/.ssh/id_github
fi
