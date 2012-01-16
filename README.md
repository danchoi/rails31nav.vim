# rails31nav.vim

A simple Vim plugin to help you traverse related Rails 3.1 files.

For example, if you were looking at `app/models/authentication.rb` and invoked
the plugin, rails31nav.vim would show you a file selection dropdown like this:

![screenshot](https://github.com/danchoi/rails31nav.vim/raw/master/screen.png)

The approach here is a different from the way Tim Pope's [vim-rails][vim-rails]
plugin traverses related files. But you should be able to use both plugins
together without conflict.

[vim-rails]:https://github.com/vim-ruby/vim-ruby/tree/master/ftdetect

## Synopsis


To open the list of Rails files related to the file open in the current buffer:

    <Leader><Leader>   # => probably ,, or \\ depending on your setup

Use `<C-n>` and `<C-p>` to move up and down the selection list. Press `ENTER`
to go to that file.

The selection list is also numbered. You can enter a menu number instead to
open that file.


## Filter

There is a simple way to filter the list of related files. Type `a` to show
only the files that are in the `app/` directory. Type `t` to show only the
files in the `test/` directory.


## Install

Copy plugin/rails31nav.vim to ~/.vim/plugin/

Quick install:

    curl https://raw.github.com/danchoi/rails31nav.vim/master/plugin/rails31nav.vim > ~/.vim/plugin/rails31nav.vim

## Customize

If you want to use another key combo to open the related files dropdown, put
something like this in your `.vimrc`:

    map <Leader>xx :call Rails31Nav_show_drop_down()<cr>

## Author

Daniel Choi http://github.com/danchoi
