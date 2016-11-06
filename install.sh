
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
HOMEBREW_LOCKS_FOLDER=\$HOME/.brew/var/homebrew

mkdir -p \$HOMEBREW_LOCKS_TARGET
mkdir -p \$HOMEBREW_LOCKS_FOLDER

# Symlink to Locks target folders
# If not already a symlink
if ! [[ -L \$HOMEBREW_LOCKS_FOLDER && -d \$HOMEBREW_LOCKS_FOLDER ]]; then
  echo "Creating symlink for Locks folder"
  rm -rf \$HOMEBREW_LOCKS_FOLDER
  ln -s \$HOMEBREW_LOCKS_TARGET \$HOMEBREW_LOCKS_FOLDER
fi

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
