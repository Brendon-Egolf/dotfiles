set nocompatible
filetype off " !required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Bundle 'mattn/gist-vim'
" Bundle 'mattn/webapi-vim'
Plugin 'AndrewRadev/switch.vim'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/vimshell.vim'
Plugin 'SirVer/ultisnips'
Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'digitaltoad/vim-pug'
" Plugin 'drmikehenry/vim-headerguard'
Plugin 'easymotion/vim-easymotion'
" Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'henrik/vim-indexed-search'
Plugin 'honza/vim-snippets'
" Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mattn/emmet-vim'
Plugin 'michaeljsmith/vim-indent-object'
" Plugin 'mtth/scratch.vim'
" Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tclem/vim-arduino'
" Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/AutoComplPop'
" Plugin 'vim-scripts/slimv.vim'
" Plugin 'wavded/vim-stylus'
call vundle#end()
filetype plugin indent on

let s:colorColumnString = ''
let i = 1
while i <= 22
    let column = (i * &tabstop) + 1 " plus one so that the colored column lines up with
                                    " the first character
    let s:colorColumnString .= column . ','
    let i += 1
endwhile

" set omnifunc=syntaxcomplete#Complete
" set completeopt=longest,menuone
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
let g:SuperTabDefaultCompletionType = "<c-n>"

set tabstop=2 shiftwidth=2 expandtab
set spell
set formatprg=par\ -w90
set cc=91
set nu
set wmh=0
set incsearch
set scrolloff=9999
set switchbuf=split
set relativenumber
set undofile                " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set pastetoggle=<F5>
set autoindent
set smartindent
set ignorecase
set smartcase
set smarttab
set winaltkeys=no
set linebreak
set autoread
set autowriteall
set backspace=2
set cursorcolumn
set textwidth=89
set formatoptions=tcqn1j

" let &colorcolumn=s:colorColumnString.'90'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'arm-linux-gnueabihf-g++'
let g:syntastic_cpp_compiler_options = "-O3 -fPIC -g -Wall -Werror -std=c++11"
hi clear SpellBad

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax on
colorscheme darcula
noremap ; :
noremap ;; ;
map <leader>= =
noremap - <C-W>-
nnoremap = <C-W>+
noremap _ <C-W><
noremap + <C-W>>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
map <Space> @q
" map <C-x> :FixWhitespace<CR>
map <F2> <esc>:!clear && make -r<Enter><Enter>
map <C-n> :NERDTreeToggle<CR>
" map <C-f> <esc>gqip
map <F3> :noautocmd vimgrep /TODO/ **/*<enter>
map <F4> :!clear && ./%<Enter>
map <C-_> gcc
  map <Leader>z z=1<Enter>
nnoremap <Leader>p "*p
nmap :make :make vert copen<Enter>
nnoremap j gj
nnoremap k gk
" imap {<CR> {<CR><CR>}<esc>kA<tab>
imap jk <esc>
nnoremap <Leader>= =
nnoremap <Tab> >>
nnoremap <S-Tab> <<
" nnoremap / /\v
nnoremap ,at vap:Tab /&<Enter>vap:Tab /\\\\<Enter>

" vim-markdown configuration
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

autocmd BufEnter *.es6,*.html,*.scss map <F2> :!npm run build<Enter>
autocmd BufEnter *.md map <F2> :!pandoc -o document.pdf % -s && mupdf document.pdf <Enter><Enter>
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
let mapleader=","
let g:netrw_silent = 1

" Tabular configuration
"

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>a<bar> :Tabularize /<bar><CR>
  vmap <Leader>a<bar> :Tabularize /<bar><CR>
  nmap <Leader>a& :Tabularize /&=<CR>
  vmap <Leader>a& :Tabularize /&=<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" UltiSnips configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" emmet configuration
let g:user_emmet_mode='a'    "enable all function in all mode.
