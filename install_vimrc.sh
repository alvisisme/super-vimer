#!/bin/sh
set -e

cd ~/.vim_runtime
echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

echo "Installed the C/C++ Vim configuration successfully! Enjoy :-)"
