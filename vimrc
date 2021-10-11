set encoding=utf-8
set nocompatible

filetype plugin indent on
syntax on

set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround
set number
set relativenumber
set cursorcolumn
set cursorline
set textwidth=80
set colorcolumn=+1
set incsearch
set hlsearch

" Auto instalacion de PLug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"===============================
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" surround
Plug 'tpope/vim-surround'
"fzf
Plug 'junegunn/fzf', {'do' : { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
" Insert/Replace
Plug 'wincent/terminus'
" Autocompletado
 Plug 'neoclide/coc.nvim'
 Plug 'davidhalter/jedi-vim'
 Plug 'ayu-theme/ayu-vim'
 Plug 'dhruvasagar/vim-pairify'

"===============================
call plug#end()


"-------- Configure netrw ----------
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
let g:netrw_altv=1


" Show spaces
" set list
" show leading spaces
hi Conceal guibg=NONE ctermbg=NONE ctermfg=DarkGray
autocmd BufRead * setlocal conceallevel=2 concealcursor=nv
autocmd BufRead * syn match LeadingSpace /\(^ *\)\@<= / containedin=ALL conceal cchar=Â·

set splitright
set splitbelow
