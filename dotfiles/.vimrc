set nocompatible              " be iMproved, required
filetype off                  " required

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
let g:mycolors=['solarized8_dark_low', 'axmac-morning']

"Color theme
syntax enable
set background=light
colorscheme solarized8_dark_low
se t_Co=16

"Override default highlights
highlight Search cterm=reverse ctermfg=12 ctermbg=8 gui=reverse guifg=#839496 guibg=#002b36
"highlight Directory ctermfg=3 guifg=#b58900
"highlight Identifier term=standout cterm=bold ctermfg=6 gui=bold guifg=#2aa198

"Shortcuts
"Override default file explorer with NERDTree
:command E NERDTree
:command EF NERDTreeFind
:cabbrev at AirlineTheme
:cabbrev cs colorscheme
"Alias fzf commands
:command LS Buffers

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

" Strip trailing whitespace from nominated file types
autocmd FileType yaml,yml,rb,cfg,md autocmd BufWritePre <buffer> %s/\s\+$//e

" Alternative to stripping on save, use a function
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

:noremap <F5> :call TrimWhitespace()<CR>

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

"Livedown command reference:
" launch the Livedown server and preview your markdown file
"   :LivedownPreview
"
" stop the Livedown server
"   :LivedownKill
"
" launch/kill the Livedown server
"   :LivedownToggle
:noremap <F11> :LivedownToggle<CR>

fun CleanForMouseSelect()
"    normal <Ctrl+w><Ctrl+o>
    :set nonumber
    return 0
endfun

:noremap <F12> :call CleanForMouseSelect()<CR>
