      #########.
     ########",#:
   #########',##".
  ##'##'## .##',##.
   ## ## ## # ##",#.
    ## ## ## ## ##'
     ## ## ## :##
      ## ## ##."

# Delete and reinstall Homebrew from Github repo
rm -rf $HOME/.brew
git clone https://github.com/Homebrew/homebrew $HOME/.brew

# Create .homebrewfix script in home directory
cat > $HOME/.homebrewfix.sh <<EOL
# HOMEBREW CONFIG

# Add brew to path
export PATH=\$HOME/.brew/bin:\$PATH
launchctl setenv PATH $PATH

# Set Homebrew temporary folders
export HOMEBREW_CACHE=/tmp/\$USER/Homebrew/Caches
export HOMEBREW_TEMP=/tmp/\$USER/Homebrew/Temp
export HOMEBREW_LOCKS=/tmp/\$USER/Homebrew/Locks

launchctl setenv HOMEBREW_CACHE \$HOMEBREW_CACHE
launchctl setenv HOMEBREW_TEMP  \$HOMEBREW_TEMP
launchctl setenv HOMEBREW_LOCKS \$HOMEBREW_LOCKS

mkdir -p \$HOMEBREW_CACHE
mkdir -p \$HOMEBREW_TEMP

# Create symlink for Locks folder
rm -rf \$HOME/.brew/Library/Locks
mkdir -p \$HOMEBREW_LOCKS
ln -s /tmp/\$USER/Homebrew/Locks \$HOME/.brew/Library/Locks
EOL

# Add .homebrewfix sourcing to launchd
cat > ~/Library/LaunchAgents/io.kube.homebrewfix.plist <<EOL
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>io.kube.homebrewfix</string>

    <key>ProgramArguments</key>
    <array>
      <string>zsh</string>
      <string>-c</string>
      <string>~/.homebrewfix.sh</string>
    </array>

    <key>KeepAlive</key>
    <false/>
    <key>RunAtLoad</key>
    <true/>
  </dict>
</plist>
EOL

chmod +x ~/.homebrewfix.sh

# Source .homebrewfix and update Homebrew
source $HOME/.homebrewfix.sh
brew update

echo "\nPlease restart your terminal to apply modifications"
