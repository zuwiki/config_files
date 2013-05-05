" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
Bundle 'Shougo/neocomplcache'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'lukerandall/haskellmode-vim'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
" Bundle 'FuzzyFinder'
Bundle 'othree/vim-autocomplpop'
Bundle 'The-NERD-Commenter'
"Bundle 'othree/html5'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'go'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set nohlsearch

filetype plugin indent on

set autoindent		" always set autoindenting on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" Don't use Ex mode, use Q for formatting
map Q gq

set nobackup
set nowritebackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" No Help, please
nmap <F1> <Esc>

" Press ^F from insert mode to insert the current file name
imap <C-F> <C-R>=expand("%")<CR>

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" Use Ack instead of Grep when available
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

" Color scheme
set background=dark
colorscheme solarized

" Font
set guifont=Inconsolata\ for\ Powerline:h12

" Display extra whitespace
set list listchars=tab:»·,trail:·
highlight! link SpecialKey Comment

" Numbers
set number
set numberwidth=5

" Window navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

set t_Co=256

set clipboard=unnamed

" haskellmode config
au Bufenter *.hs compiler ghc
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

let g:neocomplcache_enable_at_startup = 1
let g:EasyMotion_leader_key = '<Leader>' 

let g:NERDSpaceDelims = 1

