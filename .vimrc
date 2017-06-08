set nocompatible
filetype off " !required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Bundle 'mattn/gist-vim'
" Bundle 'mattn/webapi-vim'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/vimshell.vim'
" Plugin 'drmikehenry/vim-headerguard'
" Plugin 'elzr/vim-json'
" Plugin 'ervandew/supertab'
" Plugin 'jaxbot/semantic-highlight.vim'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'kien/rainbow_parentheses.vim'
" Plugin 'mtth/scratch.vim'
" Plugin 'raimondi/delimitmate'
" Plugin 'vim-scripts/slimv.vim'
" Plugin 'xolox/vim-session'
Bundle 'lrvick/Conque-Shell'
Plugin 'airblade/vim-gitgutter'
Plugin 'AndrewRadev/switch.vim'
" Plugin 'burnettk/vim-angular'
Plugin 'SirVer/ultisnips'
Plugin 'bronson/vim-trailing-whitespace'
" Plugin 'digitaltoad/vim-pug'
Plugin 'easymotion/vim-easymotion'
" Plugin 'gcmt/taboo.vim'
Plugin 'gmarik/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'henrik/vim-indexed-search'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jpalardy/vim-slime'
Plugin 'kana/vim-submode'
Plugin 'leafgarland/typescript-vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/emmet-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'othree/yajs.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tclem/vim-arduino'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-perl/vim-perl'
Plugin 'vim-scripts/Align'
Plugin 'wavded/vim-stylus'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
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
" set cursorcolumn
set textwidth=89
set formatoptions=tcqn1j
set tags=./tags;

" let &colorcolumn=s:colorColumnString.'90'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = "-O3 -fPIC -g -Wall -Werror -std=c++11 -fextended-identifiers"
hi clear SpellBad

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax on
colorscheme darcula
noremap ; :
noremap ;; ;
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
map <F6> :!clear && perl6 %<Enter>
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
nnoremap <Leader>t :!gnome-terminal<Enter><Enter>
nnoremap <Leader>ut :UpdateTags<Enter>:HighlightTags<Enter>
cnoreabbrev cd cd %:p:h

autocmd BufEnter *.pl6 set nospell

" vim-markdown configuration
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

autocmd BufEnter *.es6,*.html,*.scss map <F2> :!npm run build<Enter>
" autocmd BufEnter *.yml set tabstop=4 shiftwidth=4 expandtab
autocmd BufEnter *.yml set nospell
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

" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match Keyword /^[^,]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)

" vim-session configuration
let g:session_default_name='.Session'
let g:session_autoload='yes'
let g:session_autosave_periodic=1
let g:session_autosave_silent=1
let g:session_verbose_messages=0

" vim-JSDoc
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_access_descriptions=1
let g:jsdoc_enable_es6=1
let g:jsdoc_underscore_private=1

" easytags configuration
"
