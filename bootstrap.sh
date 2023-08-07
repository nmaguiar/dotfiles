#!/usr/bin/env bash

if [ "$GITHUB_REPOSITORY" = "nmaguiar/test" ]; then
  /usr/bin/bash /workspaces/$(echo $GITHUB_REPOSITORY | sed 's/nmaguiar\///')/.github/bootstrap.sh > /tmp/bootstrap.log 2>&1 
else
  export > /tmp/bootstrap.env
fi

curl https://openaf.io/nightly/install.sh | sh 
sudo bash -c "echo 'if [ ! -e /etc/bash_completion.d/openaf-ojobio-complete ] || [ $(find /etc/bash_completion.d/openaf-ojobio-complete -mtime +1) ]; then ojob ojob.io/unix/ojobComplete > /etc/bash_completion.d/openaf-ojobio-complete; fi' >> /etc/bash.bashrc"
