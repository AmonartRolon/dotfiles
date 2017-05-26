set splitright

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"no error bells no visualbells
set noeb vb t_vb=

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set expandtab

set clipboard=unnamed

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set expandtab
    \ set shiftwidth=4
    \ set softtabstop=4
    \ set autoindent
    \ set textwidth=79
    \ set fileformat=unix
    \ set encoding=utf-8

au BufNewFile,BufRead *.c, *.cpp, *.h, *.hpp
    \ set tabstop=4
    \ set shiftwidth=4
    \ set softtabstop=4
    \ set textwidth=79
    \ set autoindent
    \ set expandtab

set colorcolumn=80
set mouse-=a

set number
set relativenumber

"syntax enable
set background=light
"colorscheme solarized

set guioptions+=a
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set switchbuf=useopen,split
set makeprg=build.bat
nmap <m-m> :make<CR><CR><c-l>:hide<CR>:vert<space>cope 70<CR>
nmap <m-r> :source $MYVIMRC<CR>

" Remap TAB to keyword completion
function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  elseif "forward" == a:direction
    return "\<c-n>"
  else
    return "\<c-x>\<c-k>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper ("forward")<CR>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<CR>
inoremap <c-tab> <c-r>=InsertTabWrapper ("startkey")<CR>

" toggle tab completion
function! ToggleTabCompletion()
  if mapcheck("\<tab>", "i") != ""
    :iunmap <tab>
    :iunmap <s-tab>
    :iunmap <c-tab>
    echo "tab completion off"
  else
    :imap <tab> <c-n>
    :imap <s-tab> <c-p>
    :imap <c-tab> <c-x><c-l>
    echo "tab completion on"
  endif
endfunction

map <Leader>tc :call ToggleTabCompletion()<CR>
" Remap TAB to keyword completion END

if has('gui_running')
    set guifont=Liberation\ Mono:h9
endif

let mapleader = "\<space>"
:nnoremap <leader>s :%s/\<<C-r><C-w>\>//g<left><left>

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/TogFullscreen.vim'
"Plug 'altercation/vim-colors-solarized'

call plug#end()
