42 Homebrew
===========

This script installs Homebrew properly in your home on your 42 session.

It works on **ISCSI sessions**, and fixes `flock` issues on **NFS sessions**.

It will also move all temporary Homebrew data (`Temp`, `Cache`, `Locks`) to a dedicated folder in `/tmp`, leaving your home directory cleaner.


Install
-------
Run this command from your terminal:

```sh
zsh -c "$(curl -fsSL https://raw.githubusercontent.com/kube/42homebrew/master/install.sh)"
```

Homebrew is now ready on your session.

How it works
------------
This script removes your current Homebrew installation in your home if any, and reinstalls it properly from the Homebrew Github repo.

Then it simply creates a `.brewconfig.zsh` script in your home directory, and modifies your `.zshrc` to source the script.

It is simple to remove, and you can re-run it multiple times without duplication.


Uninstall
---------
Simply remove these lines from your `.zshrc`

```sh
# Load Homebrew Fix script
source $HOME/.brewconfig.zsh
```

And delete `.brewconfig.zsh` in your home directory.
