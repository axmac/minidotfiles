set nocompatible              " be iMproved, required
filetype off                  " required

" Fix NERDTree presentation and behaviour in SSH sessions.
" https://stackoverflow.com/questions/8753286/nerd-tree-enter-does-not-open-sub-dirs
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'lifepillar/vim-solarized8'
Plugin 'axmac/vim-switch-colorschemes'
Plugin 'axmac/vim-morning'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'shime/vim-livedown'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'gagoar/StripWhiteSpaces'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"
" Plugin and other settings below here
"

let g:vim_markdown_folding_disabled = 1
let g:airline#extensions#tabline#enabled = 1

set laststatus=2

" Use F8 to switch between the color schemes in the SetColors list
"let g:mycolors=['solarized8_dark_low', 'axmac-morning']

"Color theme
syntax enable
set background=dark
colorscheme solarized8
set t_Co=256

"Shortcuts
"Override default file explorer with NERDTree
command E NERDTree
command EF NERDTreeFind
cabbrev at AirlineTheme
cabbrev cs colorscheme
"Alias fzf commands
command LS Buffers

"Tab behaviour
"From http://vi.stackexchange.com/questions/4541/vundle-filetype-plugin-indent-on-messes-with-tabwidth
set expandtab   " Make sure that every file uses spaces, not tab
set shiftround  " Round indent to multiple of 'shiftwidth'
set autoindent  " Copy indent from current line, over to the new line

" Set the tab width
let s:tabwidth=2
au Filetype * let &l:tabstop = s:tabwidth
au Filetype * let &l:shiftwidth = s:tabwidth
au Filetype * let &l:softtabstop = s:tabwidth

" Ensure search highlighing is turned on
" Show current highlight settings with :highlight
set hlsearch

"Indent guides
"let g:indent_guides_enable_on_vim_startup = 1

"Line numbers
set number

"Expand tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Vertical line at x chars
set colorcolumn=120

"Livedown command reference:
" launch the Livedown server and preview your markdown file
"   :LivedownPreview
"
" stop the Livedown server
"   :LivedownKill
"
" launch/kill the Livedown server
"   :LivedownToggle
noremap <F11> :LivedownToggle<CR>

" Open the current buffer in a new tab without line numbers for mouse
" select/copy. (Close the tab after copying to return to the original view.)
fun CleanForMouseSelect()
    :tabe %
    :set nonumber
    return 0
endfun

noremap <F12> :call CleanForMouseSelect()<CR>

nnoremap o o<Esc>
nnoremap O O<Esc>

" Show buffer list with F5, then type the buffer number to switch to.
" From https://vim.fandom.com/wiki/Easier_buffer_switching
nnoremap <F5> :buffers<CR>:buffer<Space>

" Fix ctrl+cursor word movement
execute "set <xUp>=\e[1;*A"
execute "set <xDown>=\e[1;*B"
execute "set <xRight>=\e[1;*C"
execute "set <xLeft>=\e[1;*D"

command! -nargs=* Wrap set wrap linebreak nolist

" Syntax highlighting for files in .ssh
autocmd BufRead,BufNewFile ~/.ssh/*.config set syntax=sshconfig

" No whitespace stripping on vim diff files
autocmd Filetype diff let b:disable_StripWhiteSpaces=1
