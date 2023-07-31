#!/usr/bin/env bash

curl https://openaf.io/nightly/install.sh | sh 
echo if [ ! -e /etc/bash_completion.d/openaf-ojobio-complete ] || [ $(find /etc/bash_completion.d/openaf-ojobio-complete -mtime +1) ]; then ojob ojob.io/unix/ojobComplete > /etc/bash_completion.d/openaf-ojobio-complete; fi" >> /etc/bash.bashrc
