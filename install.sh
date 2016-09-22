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
export HOMEBREW_LOCKS=/tmp/\$USER/Homebrew/Locks

mkdir -p \$HOMEBREW_CACHE
mkdir -p \$HOMEBREW_TEMP

# Create symlink for Locks folder
rm -rf \$HOME/.brew/Library/Locks
mkdir -p \$HOMEBREW_LOCKS
ln -s /tmp/\$USER/Homebrew/Locks \$HOME/.brew/var/library/locks

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
