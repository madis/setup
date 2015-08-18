#!/usr/bin/env bash

# RVM & Ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.2
rvm install jruby-9.0.0.0

# NVM & Node.js
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.0/install.sh | bash
nvm install v0.12.7
