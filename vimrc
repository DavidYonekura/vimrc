" this is to receive CTRL-S and CTRL-Q
silent !stty -ixon > /dev/null 2>/dev/null

" disable vi compatibility (emulation of old bugs)
set nocompatible

" setup Vundle (run :PluginInstall to install plugins)
filetype plugin on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugin to enable Vundle 
Plugin 'VundleVim/Vundle.vim'
" plugin to enable word completition 
Plugin 'Valloric/YouCompleteMe'

" plugin to enable better syntax highlight 
Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'jiangmiao/auto-pairs'

" plugin to enable lightline
" Plugin 'itchyny/lightline.vim'
Plugin 'powerline/powerline.vim'
set laststatus=2
set noshowmode
set ttymouse=xterm2
set mouse=a



" enable NERD tree - allows you to explore your filesystem 
" and to open files and directories.
Plugin 'scrooloose/nerdtree.git'

" enable CTRLP - Full path fuzzy file, buffer, mru, tag, 
" etc, finder for Vim
Plugin 'ctrlpvim/ctrlp.vim'
" enable vimtex
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'


" enable fzf
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'

" syntax checking plugin for Vim that runs files through external syntax
" checkers and displays any resulting errors to the user.
Plugin 'scrooloose/syntastic'

" buffer explorer
Plugin 'jlanzarotta/bufexplorer'


" end of Vundle initialization
call vundle#end()
filetype plugin indent on
filetype on

" set path variable to current directory (from which you launched vim)
" and to all directories under current directory recursively
set path=$PWD/**

" set spell check
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=pt
autocmd FileType txt setlocal spell spelllang=pt
autocmd FileType tex setlocal spell spelllang=pt
" set spell spelllang=en

" autocomplete words
set complete+=kspell

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 120 chars.
set textwidth=120

" show column number
set ruler

" turn syntax highlighting on
syntax on                                                                                                     
colorscheme molokai                                                                                           
" set termguicolors                                                                                             

" highlight matching braces
"set showmatch

" enhanced tab completion on commands
set wildmenu
set wildmode=longest:list,full

" buffer can be in the background if it’s modified
set hidden

" Search
set hlsearch     " highlight matches
set incsearch    " incremental searching
set ignorecase   " searches are case insensitive...
set smartcase    " ... unless they contain at least one capital letter

" automatically open and close the popup menu / preview window      
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif      
set completeopt=menuone,menu,longest,preview

" cscope
set cscopetag

" tags definition
set tags+=tags;                     " search tags automagically
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" CTRLP configuration
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 't'
" MAPPINGS

"nerd tree
map <C-b> :NERDTreeToggle<CR>


" (F2, CTRL-S) Save file
nmap <c-s> :w<CR>
imap <c-s> <c-o><c-s>
nmap <F2> :w<CR>
imap <F2> <c-o><F2>

" (CTRL-Q) close file
nmap <c-q> :q<CR>
imap <c-q> <c-o><c-q>

" (F10) buffer explorer
noremap <silent> <F10> <ESC>:BufExplorer<CR>
"
" (CTRL-O) open nerd tree
nnoremap <C-o> <ESC>:NERDTreeToggle<CR>
" default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" syntax highlight config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let c_no_curly_error=1
let g:cpp_experimental_template_highlight = 1


" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"display num of lines
set tabpagemax=100
set relativenumber
set number
set timeoutlen=1000 ttimeoutlen=0

set t_ut=
" firefox tab navigation
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap J gT
nnoremap K gt

map q: <Nop>
nnoremap Q <nop>
autocmd FileType python map <F5> <Esc>:w<CR>:!clear;python %<CR>

" latex-preview configs
let g:livepreview_previewer = 'zathura'
let maplocalleader = "\\"

let g:vimtex_view_general_viewer = 'zathura'
let g:AutoPairsShortcutBackInsert=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsMoveCharacter=''
