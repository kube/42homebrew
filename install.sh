
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
git clone --depth=1 https://github.com/Homebrew/brew $HOME/.brew

# Create .brew_fix script in home directory
cat > $HOME/.brew_fix.zsh <<EOL
# HOMEBREW CONFIG

# Add brew to path
export PATH=\$HOME/.brew/bin:\$PATH

# Set Homebrew temporary folders
export HOMEBREW_CACHE=/tmp/\$USER/Homebrew/Caches
export HOMEBREW_TEMP=/tmp/\$USER/Homebrew/Temp

mkdir -p \$HOMEBREW_CACHE
mkdir -p \$HOMEBREW_TEMP

HOMEBREW_LOCKS_TARGET=/tmp/\$USER/Homebrew/Locks
HOMEBREW_LOCKS_FOLDER=\$HOME/.brew/var/library/locks

mkdir -p \$HOMEBREW_LOCKS_TARGET

# Symlink to Locks target folder
rm -f \$HOMEBREW_LOCKS_FOLDER
ln -s \$HOMEBREW_LOCKS_FOLDER \$HOMEBREW_LOCKS_TARGET

EOL

# Add .brew_fix sourcing in your .zshrc if not already present
if ! grep -q "# Load Homebrew Fix script" "$HOME/.zshrc"; then

cat >> $HOME/.zshrc <<EOL

# Load Homebrew Fix script
source \$HOME/.brew_fix.zsh
EOL

fi

source $HOME/.brew_fix.zsh
brew update

echo "Please open a new terminal to apply modifications"
