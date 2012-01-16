# rails31nav.vim

A simple Vim plugin to help you traverse related Rails 3.1 files.

![screenshot](https://github.com/danchoi/rails31nav.vim/raw/master/screen.png)

## Synopsis


To open the list of Rails files related to the file open in the current buffer:

    <Leader><Leader> 

Use `<C-n>` and `<C-p>` to move up and down the selection list. Press `ENTER`
to go to that file.

The selection list is also numbered. You can enter a menu number instead to
open that file.


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
