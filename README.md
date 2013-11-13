# My Emacs settings

This is only a public template for my Emacs settings.
The main purpose is to share how I handle all my settings,
and packages without crying or making a mess.

## Setup

To grab all the dependencies:

    git clone --recursive git://github.com/gnusosa/.emacs.d.git

The first time you start Emacs, it will install some additional packages
that are best handled by the package manager.

## Install Emacs

### GNU/Linux

I use the default Emacs provided by both distributions package managers I use the most.

#### Gentoo

    emerge -av emacs

I recommend adding `emacs` as a keyword in your system wide `USE` flags.

#### Debian

    apt-get install emacs

### Mac OS X

I use Cocoa Emacs on Mac OS X. It's best installed and handled by homebrew.
You can installed like these:

    brew install emacs --cocoa

After that you have to copy `Emacs.app` from the brew Cellar into
`/Applications` instead of the symlink that brew places there.

## Tips for using these emacs settings

This settings are a modification on magnar's Emacs settings,
so shout out to him. You the man dawg.

Original magnar's repository:

    git clone --recursive git://github.com/magnars/.emacs.d.git

Therefore, most of the original keybindings still remain.

### What differs from magnars repository

* I require the correct lisp list paths for Mac OS X and GNU/Linux (soon BSD).

* I use system mu4e provided from the OS package manager.

* Removed most setup modes for Groovy, Java, and Javascript.

* Added ag, calfw, hackernews, haml-mode, org-jira, twit, and znc. All from MELPA.

* Unicode for everything. Seriously; if you don't Unicode at everything, GTFO RTFM.

* Two extra frames at boot.

If you want to use my settings straight out of the box, here are some things to note:

 * I recommend starting with a blank emacs +
   [Technomancy's better-defaults package](https://github.com/technomancy/better-defaults),
   and then dig through this repo for useful nuggets, instead of forking it directly.

 * Start by reading up on all the cool stuff in key-bindings.el.

 * You quit emacs with `C-x r q`, mnemonic *Really Quit*.

 * Find file in project with `C-x o`, in dir with `C-x C-f`, recent with `C-x f`

 * Add your user- and project-specific stuff in .emacs.d/users/[machine name]/*.el

 * `C-h` is rebound to backspace, like in the shell. Get help on `F1` instead.

 * Autocomplete with `C-.` (autocomplete entire lines with `C-:`)

 * expand-region is your friend. Find its bound key by doing `F1 f er/expand-region`

 * Undo with `C-_` and redo with `M-_`. Watch the undo-tree with `C-x u`

  * Indent and clean up white space in the entire buffer with `C-c n`

 * On a mac, the Meta key `M` is bound to Command.

 * I recommend rebinding Caps Lock to Ctrl and use that instead of the often badly placed Ctrl-key.

 * Watch [emacsrocks.com](http://emacsrocks.com)

### Files

* `C-x C-f` Open a file. Starts in the current directory
* `C-x f  ` Open a recently visited file
* `C-x o  ` Open a file in the current project (based on .git ++)
* `C-x C-s` Save this file
* `C-x C-w` Save as ...
* `C-x C-j` Jump to this files' current directory
* `C-x b  ` Switch to another open file (buffer)
* `C-x C-b` List all open files (buffers)

### Cut copy and paste

* `C-space` Start marking stuff. C-g to cancel.
* `C-w    ` Cut (aka kill)
* `C-k    ` Cut till end of line
* `M-w    ` Copy
* `C-y    ` Paste (aka yank)
* `M-v    ` Paste from OS clipboard (aka yank)
* `<Print>` Paste from OS clipboard (aka yank) for `Thinkpads`.
* `M-y    ` Cycle last paste through previous kills
* `C-x C-y` Choose what to paste from previous kills
* `C-@    ` Mark stuff quickly. Press multiple times

### General

* `C-g    ` Quit out of whatever mess you've gotten yourself into
* `M-x    ` Run a command by name
* `C-.    ` Autocomplete
* `C-_    ` Undo
* `M-_    ` Redo
* `C-x u  ` Show the undo-tree
* `C-x m  ` Open magit. It's a magical git interface for emacs

### Navigation

* `C-arrow` Move past words/paragraphs
* `C-a    ` Go to start of line
* `C-e    ` Go to end of line
* `M-g M-g` Go to line number
* `C-x C-i` Go to symbol
* `C-s    ` Search forward. Press `C-s` again to go further.
* `C-r    ` Search backward. Press `C-r` again to go further.

### Window management

* `C-x 0  ` Close this window
* `C-x 1  ` Close other windows
* `C-x 2  ` Split window horizontally
* `C-x 3  ` Split window vertically
* `S-arrow` Jump to window to the left/right/up/down

### Help

* `F1 t   ` Basic tutorial
* `F1 k   ` Help for a keybinding
* `F1 r   ` Emacs' extensive documentation
