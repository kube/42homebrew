42 Homebrew Fix
===============

This script installs Homebrew properly in your home on your 42 session.

It was created to fix the `flock` issue on **NFS sessions**, but works well on **ISCSI sessions** too.

It will move all temporary Homebrew data (`Temp`, `Cache`, `Locks`) to a dedicated folder in `/tmp`, leaving your home directory cleaner, so it's useful even if you're on the new ISCSI sessions. 


Install
-------
Run this command from your terminal:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/kube/42homebrewfix/master/install.sh)"
```

How it works
------------
This script removes your current Homebrew installation in your home, and reinstalls it properly from the Homebrew Github repo.

Then it simply creates a `.brew_fix.zsh` script in your home directory, and modifies your `.zshrc` to source the script.

It is simple to remove, and you can re-run it multiple times without duplication.


Uninstall
---------
Simply remove these lines from your `.zshrc`

```sh
# Load Homebrew Fix script
source $HOME/.brew_fix.zsh
```

And delete `.brew_fix.zsh` in your home directory.
