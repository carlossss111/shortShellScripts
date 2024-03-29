# Short Shell Scripts
To install a script globally use a sys-link:
```
sudo ln -s /PATH/TO/script.sh /usr/local/bin/NAME
```
## Scripts
`Ctemplate.sh` makes a file with the C program boilerplate.

`degitifier.sh` _takes 1 Arg for parent directory_, recursively moves through subdirectories removing '.git' files.

`discoverPrinters.sh` toggles discoverability of LAN printers on/off with CUPS.

`escapify.sh` _takes 1 Arg for string, another OPTIONALLY for token_, puts an escape character before every instance of the token (double-quotes by default).

`helloworld.sh` echoes hello world.

`key+2.sh` _takes one-to-two args: [string to encrypt|'-d'] [with -d option: string to decrypt]_, it's just a +2 caesar cipher that's it.

`killdiscord.sh` kills the discord application (it freezes sometimes) and immediately reopens it.

`listgen.sh` _takes two-to-four Args: [FSTRING] [optional: START] [END] [optional: STEP]_, produces a list of n strings with any '?'s being replaced with n. '\\?' is not changed.

`newvimwindow.sh` loads the vim text editor in a new terminal window .

`promptcustomiser.sh` (DEPRECATED, better to do manually) runs through the process of changing $PS1 and appending it to bash.rc. Has different colour options, an option to include a header or not and an option set a default starting directory.

`rabidcomments.sh` _takes 1 Arg for file name_, comments out an entire file just cause.

`scripttemplate.sh` makes a file with the bash shebang and correct permissions.

`themeswitcher.sh` (_cinnamon DE only_) switches between dark and light mode GUI elements.

`webtemplate.sh` _takes 1 Arg for name_, creates a new directory with the name provided, filled with boilerplate HTML, CSS and JS code.

## Dependencies
__listgen__ requires __xclip__. xclip is for GUI copy/paste functionality and is installed by default on many distributions, but can also be installed with the apt package manager:
```
sudo apt update
sudo apt install xclip
```

__themeswitcher__ is based on the [Cinnamon](https://en.wikipedia.org/wiki/Cinnamon_(desktop_environment)) (4.8.6) desktop environment and I wouldn't expect it to work out of the box on any other desktop.
