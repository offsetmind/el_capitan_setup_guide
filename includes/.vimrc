" ================================= "
" Created by: ncuxomozg             "
" Contact   : octopus@mozgcorp.ru   "
" ================================= "

set mouse=a
set number
set relativenumber
syntax on

filetype on
filetype plugin on
filetype indent on

set ttyfast
set lazyredraw

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

set guioptions-=L

set nocompatible

" test
set ttimeout
set ttimeoutlen=250
set notimeout

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
" ==== plugin here ====

Plugin 'VundleVim/Vundle.vim'
Plugin 'benmills/vimux'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'jlanzarotta/bufexplorer' 
Plugin 'c9s/perlomni.vim'
Plugin 'vim-perl/vim-perl', { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'

" clang required
" Plugin 'valloric/youcompleteme'
Bundle 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'

" ACK required (ubuntu: ack-grep) 
Plugin 'mileszs/ack.vim'
Plugin 'terryma/vim-multiple-cursors'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" syntax
Plugin 'pangloss/vim-javascript'
Plugin 'othree/html5.vim'

Plugin 'mtscout6/vim-tagbar-css'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" colors
Plugin 'damage220/solas.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhartington/oceanic-next'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()            " required
filetype plugin indent on    " required

" other configuration

set tabstop=4
set shiftwidth=4
set softtabstop=4

set autoindent
set smartindent

set laststatus=2

set encoding=utf-8
set termencoding=utf-8

set splitbelow
set splitright

set incsearch
set cursorline

set pumheight=10

set background=dark
" solarized options 
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized

set background=dark
colorscheme solarized

" tagbar config
let g:tagbar_sort = 0

let g:tagbar_iconchars = ['+', '-']


let g:tagbar_type_php = {
	\'ctagstype': 'php',
	\'kinds': [
		\'i:interfaces',
		\'c:classes',
		\'d:constants',
		\'f:functions'
	\]
\}

nmap <S-x> :TagbarToggle<CR>
nmap <S-m> :NERDTreeTabsToggle<CR>
" nmap <S-m> :Ex<CR>
nmap <S-b> :BufExplorer<CR>
nmap <F1> :tabp<CR>
nmap <F2> :tabn<CR>

" split windows
nnoremap <C-\> :vsplit<CR>

nnoremap <F12> :Ack 

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" UltiSnips - expand on enter
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
   let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction

inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" emment - expand on tab

""""""""""""""""""""""""""""""""""""""""""
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
""""""""""""""""""""""""""""""""""""""""""

let g:NERDSpaceDelims = 1

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" set guifont=/Users/mozg/.vim/fonts
set guifont=Roboto_Mono_for_Powerline:h14 

" emmet keybindings
" let g:user_emmet_expandabbr_key = '<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:use_emmet_complete_tag = 1

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

" line symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" template toolkit syntax highlight with emmet
autocmd BufNewFile,BufRead *.tt setf html


filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
 " On pressing tab, insert 4 spaces
set expandtab

if has('mouse_sgr')
    set ttymouse=sgr
endif

" encoding selection
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>

nmap <F3> :emenu Encoding.utf-8<CR>
nmap <F4> :emenu Encoding.windows-1251<CR>

map <F8> :emenu Encoding.

"--- encoding by dir 
function ChangeEncoding()
    let current_dir = expand("%:p:h")

    " dictionary: { regexp: encoding }
    let re_patterns = {
        \ 'some\.project\.name': "cp1251",
	\ 'another\.project\.regexp': "cp1251",
        \ }

    for [ pattern, encoding_name ] in items( re_patterns )
        let match = matchstr( current_dir, pattern )
        if match != ''
            execute 'e ++enc=' . encoding_name . ' %:p'
            " fix: reenable syntax after encoding
            syntax enable
        endif
    endfor

endfunction

autocmd BufNewFile,BufReadPost * call ChangeEncoding()
"---
