" plug
" Config for vim-plug
" https://github.com/junegunn/vim-plug
" https://vi.stackexchange.com/questions/9558/why-wont-vim-plug-install-my-plugins-typo

" install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
    " ensure directories exist
    execute '!mkdir -p ~/.vim/autoload'
    execute '!mkdir -p ~/.vim/plugged'
    " download vim-plug
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source ~/.vim/.plug.vim
endif

call plug#begin('~/.vim/plugged')

" Defaults everyone can agree on
Plug 'tpope/vim-sensible'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" syntax highlighting
Plug 'tomvanderlee/vim-kerboscript', { 'for': 'kerboscript' }

" Powerline
"	new file:   vim/bundle/powerline
"	new file:   vim/bundle/vim-airline
"	new file:   vim/bundle/vim-airline-themes
"	new file:   vim/bundle/vim-sensible



call plug#begin()