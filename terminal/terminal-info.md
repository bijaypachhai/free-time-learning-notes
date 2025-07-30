## Make the remote machines recognise the terminal

```bash

$ infocmp > ghostty_info
$ infocmp -C ghostty > ghostty_cap
```

### Copy these files to the remote machines

```bash

$ tic -x -o .terminfo ghostty_info

## change to root user
$ sudo su
$ tic -x -o .terminfo ghostty_info

```
