" thi is to receive CTRL-S and CTRL-Q
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
" plugin to enable better cpp syntax highlight 
Plugin 'octol/vim-cpp-enhanced-highlight'
" plugin to enable better line indentation
Plugin 'yggdroot/indentline'
" plugin to enable auto closing brackets
Plugin 'jiangmiao/auto-pairs'
" plugins to enable snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" plugin to enable lightline
Plugin 'itchyny/lightline.vim'
" enable NERD tree - allows you to explore your filesystem 
" and to open files and directories.
Plugin 'scrooloose/nerdtree.git'
" enable vimtex
Plugin 'lervag/vimtex'
" syntax checking plugin for Vim that runs files through external syntax
" checkers and displays any resulting errors to the user.
Plugin 'scrooloose/syntastic'
" buffer explorer
Plugin 'jlanzarotta/bufexplorer'
"---------------------------------------------------------------------------------
" end of Vundle initialization
call vundle#end()

set laststatus=2
set noshowmode
set ttymouse=xterm2
set term=screen-256color
set mouse=a

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

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"nerd tree
let g:NERDTreeWinPos='right'
map <C-b> :NERDTreeToggle<CR>


" (F2, CTRL-S) Save file
nmap <c-s> :w<CR>
imap <c-s> <c-o><c-s>

" (F10) buffer explorer
noremap <silent> <F10> <ESC>:BufExplorer<CR>
"
" (CTRL-O) open nerd tree
nnoremap <C-o> <ESC>:NERDTreeToggle<CR>

" syntax highlight config
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error=1

set tabpagemax=100
"display num of lines
set relativenumber
set number

set timeoutlen=1000 ttimeoutlen=0

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

set termwinsize="5*0"
map <space>'   <ESC>:botright term ++rows=10<CR> <CR> clear<CR>


" latex-preview configs
let maplocalleader = "\\"
let g:livepreview_previewer = 'zathura'
let g:vimtex_compiler_latexmk = {
            \ 'build_dir' : 'build',
            \}
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_quickfix_mode=0

let g:AutoPairsShortcutBackInsert=''
let g:AutoPairsShortcutJump=''
let g:AutoPairsMoveCharacter=''
let g:tex_conceal = ""
set conceallevel=0
set clipboard=unnamed

" snippets config
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<F6>"
let g:UltiSnipsJumpForwardTrigger="<F6>"
let g:UltiSnipsJumpBackwardTrigger="<c-F6>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
