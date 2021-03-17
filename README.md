# Short Shell Scripts
To install a script globally use a sys-link:
```
sudo ln -s /PATH/TO/script.sh /usr/local/bin/NAME
```
## Scripts
`Ctemplate.sh` makes a file with the C program boilerplate.

`helloworld.sh` echoes hello world

`killdiscord.sh` kills the discord application (it freezes sometimes) and immediately reopens it.

`listgen.sh` _takes two to four Args: [FSTRING] [optional: START] [END] [optional: STEP]_, produces a list of n strings with any '?'s being replaced with n. '\\?' is not changed.

`newvimwindow.sh` loads the vim text editor in a new terminal window .

`promptcustomiser.sh` (DEPRECATED, better to do manually) runs through the process of changing $PS1 and appending it to bash.rc. Has different colour options, an option to include a header or not and an option set a default starting directory.

`scripttemplate.sh` makes a file with the bash shebang and correct permissions.

`themeswitcher.sh` - (_cinnamon only_) switches between dark and light mode GUI elements.

`webtemplate.sh` _takes 1 Arg for name_, creates a new directory with the name provided, filled with boilerplate HTML, CSS and JS code.

## Dependencies
__listgen__ requires __xclip__. xclip is for GUI copy/paste functionality and is installed by default on many distributions, but can also be installed with the apt package manager:
```
sudo apt update
sudo apt install xclip
```

__themeswitcher__ is based on the [Cinnamon](https://en.wikipedia.org/wiki/Cinnamon_(desktop_environment)) (4.8.6) desktop environment and I wouldn't expect it to work of the box on any other desktop.
