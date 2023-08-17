#!/usr/bin/env bash

if [ "$GITHUB_REPOSITORY" = "nmaguiar/test" ]; then
  /usr/bin/bash /workspaces/$(echo $GITHUB_REPOSITORY | sed 's/nmaguiar\///')/.github/bootstrap.sh > /tmp/bootstrap.log 2>&1 
else
  export > /tmp/bootstrap.env
fi

curl https://openaf.io/nightly/install.sh | sh 
bash -c "echo 'if [ ! -e ~/.openaf-ojobio-complete ] || [ $(find ~/.openaf-ojobio-complete -mtime +1) ]; then ojob ojob.io/unix/ojobComplete > ~/.openaf-ojobio-complete; fi' >> /etc/bash.bashrc"
