#!/usr/bin/env

# Setting up raspberry pi

# Set locale according to
# http://stackoverflow.com/questions/2499794/how-to-fix-a-locale-setting-warning-from-perl
# If you use Mac OS X v10.10 (Yosemite) or above to connect in your server Linux, you can try these steps.
#
# Keep your file /etc/ssh/sshd-config original
# Put on your ~/.bash_profile
# export LANG="en_US"
# export LC_ALL=$LANG.UTF-8
# Run
#
# dpkg-reconfigure locales
# And select "en_US.UTF-8"

# Install vim

sudo apt-get install vim git

# Install ruby from rvm

