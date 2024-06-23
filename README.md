# Short Bash Scripts
To install a script use a symbolic link:
```
ln -s /PATH/TO/script.sh /usr/local/bin/NAME
```

To install a service, copy to systemd and enable:
```
cp /PATH/TO/name.service /etc/systemd/system/NAME
systemctl daemon-reload
systemctl enable NAME --now
ln /PATH/TO/related.sh /usr/bin/related.sh
```
## Useful Scripts
`countcode.sh` _takes 1 Arg for the CSV path_, counts Lines of Code (LOC) for each commit in the history of a git repository. Outputs to a CSV so that LOC can be mapped over time.

`discoverPrinters.sh` _requires `cups`_, toggles discoverability of LAN printers on/off with CUPS.

`escapify.sh` _takes 1 Arg for string, another OPTIONALLY for token_, puts an escape character before every instance of the token (double-quotes by default).

`listgen.sh` _requires `xclip`_, _takes two-to-four Args: [FSTRING] [optional: START] [END] [optional: STEP]_, produces a list of n strings with any '?'s being replaced with n. '\\?' is not changed.

`scripttemplate.sh` makes a file with the bash shebang and correct permissions.

`stopwastingtime.sh` _takes one Arg \<on/off\>_, blocks/unblocks the IP of time-wasting sites by editing /etc/hosts.

`themeswitcher.sh` _requires `cinnamon`_, switches between dark and light mode desktop environment themes.

`updatehosts.sh` _requires `wget`_, _takes one optional Arg for a non-default URL_, downloads a hostfile and replaces /etc/hosts. Allows blocking ads and malware hosts.

## Unuseful Scripts
`Ctemplate.sh` makes a file with the C program boilerplate.

`degitifier.sh` _requires `git`_, _takes 1 Arg for parent directory_, recursively moves through subdirectories removing '.git' files.

`helloworld.sh` echoes hello world.

`key+2.sh` _takes one-to-two args: [string to encrypt|'-d'] [with -d option: string to decrypt]_, it's just a +2 caesar cipher that's it.

`newvimwindow.sh` loads the vim text editor in a new terminal window .

`rabidcomments.sh` _takes 1 Arg for file name_, comments out an entire file just cause.

## Seriously out-of-date Scripts
`killdiscord.sh`, [outdated, just use pkill], kills the discord application (it freezes sometimes) and immediately reopens it.

`promptcustomiser.sh` [outdated, it's just bad] runs through the process of changing $PS1 and appending it to bash.rc. Has different colour options, an option to include a header or not and an option set a default starting directory.

`webtemplate.sh` [outdated, everyone uses weird stuff like react now anyway] _takes 1 Arg for name_, creates a new directory with the name provided, filled with boilerplate HTML, CSS and JS code.

## Systemd Services
`system76-power-startup.service` _requires `system76-power` and it's sub-dependencies_, runs the battery saver profile on startup instead of the balanced profile.

#### Author: Daniel R
