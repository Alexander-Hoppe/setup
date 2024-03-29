syntax on

set rnu
set nu
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
" set hidden
set nobackup
set laststatus=2
set statusline=[%n]\ %f%m%#todo#%=%c,%l/%L
set spell spelllang=en_us
set hlsearch
set incsearch


set colorcolumn=80

" Directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

set iskeyword-=_

let mapleader = " "

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
" nmap <leader>rn <Plug>(coc-rename)
" Double-j to exit insert mode
inoremap jj <Esc>
" Remap save
inoremap <C-s> :w <CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ALEX
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

set background=dark
" colorscheme solarized8

" Force to use underline for spell check results
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
augroup END

colorscheme gruvbox
