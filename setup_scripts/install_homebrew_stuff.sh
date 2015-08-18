#!/usr/bin/env bash

brew install git
brew install bash
brew install bash-completion

brew install rabbitmq
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rabbitmq.plist

brew install postgres
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

brew install mongodb
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist

brew install redis
launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.redis.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

brew install ffmpeg --with-opus --with-libvorbis
