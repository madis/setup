#!/usr/bin/env bash

MAXFILES_NAME="/Library/LaunchDaemons/limit.maxfiles.plist"
MAXPROC_NAME="/Library/LaunchDaemons/limit.maxproc.plist"

cat > $MAXFILES_NAME <<- EndOfFile
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>Label</key>
        <string>limit.maxfiles</string>
      <key>ProgramArguments</key>
        <array>
          <string>launchctl</string>
          <string>limit</string>
          <string>maxfiles</string>
          <string>65536</string>
          <string>65536</string>
        </array>
      <key>RunAtLoad</key>
        <true/>
      <key>ServiceIPC</key>
        <false/>
    </dict>
  </plist>
EndOfFile

cat > $MAXPROC_NAME <<- EndOfFile
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple/DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
  <plist version="1.0">
    <dict>
      <key>Label</key>
        <string>limit.maxproc</string>
      <key>ProgramArguments</key>
        <array>
          <string>launchctl</string>
          <string>limit</string>
          <string>maxproc</string>
          <string>2048</string>
          <string>2048</string>
        </array>
      <key>RunAtLoad</key>
        <true />
      <key>ServiceIPC</key>
        <false />
    </dict>
  </plist>
EndOfFile

chmod 644 $MAXFILES_NAME
chmod 644 $MAXPROC_NAME

cat > /etc/sysctl.conf <<- EndOfFile
kern.sysv.shmmax=1073741824
kern.sysv.shmmin=1
kern.sysv.shmmni=4096
kern.sysv.shmseg=32
kern.sysv.shmall=1179648
kern.maxfilesperproc=65536
kern.maxfiles=65536
EndOfFile

# Following 2 lines should be put into .bashrc to be loaded by your shell
# automatically
ulimit -n 65536
ulimit -u 2048
