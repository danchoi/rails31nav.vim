# ruby_bashrockets.vim

This gives you Vim commands to convert Ruby hashes from the older hashrocket
notation to the newer key-value notation, and back.

## Synopsis

    :Bashrockets   {:foo => 'bar', :boston => 'rocks'}  ==>   {foo: 'bar', boston: 'rocks'}
    :Hashrockets   {foo: 'bar', boston: 'rocks'}        ==>   {:foo => 'bar', :boston => 'rocks'}

You can select a range before entering these commands. They will apply the 
conversion to all the text in the range. Otherwise, the command is applied to the current line.

You can also type the first few characters of either command and try to let 
Vim tab-autocomplete it.

## Install

Copy ftplugin/ruby_bashrockets.vim to ~/.vim/ftplugin/

Quick install:

    curl https://raw.github.com/danchoi/ruby_bashrockets.vim/master/ftplugin/ruby_bashrockets.vim > ~/.vim/ftplugin/ruby_bashrockets.vim

## Author

Daniel Choi http://github.com/danchoi
