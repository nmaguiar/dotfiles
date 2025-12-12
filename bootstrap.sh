#!/usr/bin/env bash

# if [ "$GITHUB_REPOSITORY" = "nmaguiar/test" ]; then
#   /usr/bin/bash /workspaces/$(echo $GITHUB_REPOSITORY | sed 's/nmaguiar\///')/.github/bootstrap.sh > /tmp/bootstrap.log 2>&1 
# else
export > /tmp/bootstrap.env
#fi

#curl https://openaf.io/nightly/install.sh | sh 
sudo bash -c "mkdir -p /opt/oaf && curl https://openaf.io/getStatic.sh | DIST=t8 sh -s && ./ojob ojob.io/oaf/symlinks && chmod -R a+x /tmp/_oaf*"
sudo bash -c "echo 'export PATH=/opt/oaf:\$PATH' >> /etc/bash.bashrc"
sudo bash -c "echo 'source ~/.openaf_completion_bash.sh > /dev/null 2>&1' >> /etc/bash.bashrc"
sudo bash -c "echo 'if [ ! -e ~/.openaf_completion_bash.sh ] || [ $(find ~/.openaf_completion_bash.sh -mtime +1) ]; then' >> /etc/bash.bashrc"
sudo bash -c "echo '  /opt/oaf/oaf --bashcompletion all > ~/.openaf_completion_bash.sh & disown' >> /etc/bash.bashrc"
sudo bash -c "echo 'fi' >> /etc/bash.bashrc"
