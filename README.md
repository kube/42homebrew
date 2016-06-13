42 Homebrew Fix
===============

This script installs Homebrew properly in your home on your 42 session.

It fixes the `flock` issue due to NFS mount of your home directory.


Install
-------
Run this command from your terminal:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/kube/42homebrew_fix/master/install.sh)"
```

How it works
------------
This script removes your current Homebrew installation in your home, and reinstalls it properly from the Homebrew Github repo.

Then it simply creates a `.brew_fix.zsh` script in your home directory, and modifies your `.zshrc` to source the script.

It is simple to remove, and you can re-run it multiple times without duplication.


Uninstall
---------
Simply remove these lines from your `.zshrc`
```
# Load Homebrew Fix script
source $HOME/.brew_fix.zsh
```

And delete `.brew_fix.zsh` in your home directory.
