<img
  src="https://raw.githubusercontent.com/kube/vscode-42header/master/42.png" 
  width=128>

42 Homebrew
===========

### Install Homebrew properly on your 42 session

Works on **ISCSI sessions**, and fixes `flock` issues on **NFS sessions**.

Moves temporary Homebrew data (`Temp` and `Cache`) to `/tmp`, leaving your home directory cleaner.


Install
-------
Run this command from your terminal:

```sh
curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh
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
