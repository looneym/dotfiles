" """"""""""""""""""""""""""""""""""""""e"
"
"
"      INSTALL PLUGINS
"
"
"""""""""""""""""""""""""""""""""""""""

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'lfv89/vim-interestingwords'
Plugin 'tpope/vim-rails'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'thiagoalessio/rainbow_levels.vim'
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'
Plugin 'pseewald/vim-anyfold'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'mhinz/vim-signify'
call vundle#end()     

"""""""""""""""""""""""""""""""""""""""
"
"
"      CONFIGURE PLUGINS
"
"
"""""""""""""""""""""""""""""""""""""""

""
"" => rainbow levels
""
map <leader>l :RainbowLevelsToggle<cr>
" color scheme for indent-based syntax highlighting with rainbowlevels
let g:rainbow_levels = [
    \{'ctermfg': 68,  'guifg': '#6699cc'},
    \{'ctermfg': 203, 'guifg': '#ec5f67'},
    \{'ctermfg': 221, 'guifg': '#fac863'},
    \{'ctermfg': 114, 'guifg': '#99c794'},
    \{'ctermfg': 176, 'guifg': '#c594c5'},
    \{'ctermfg': 209, 'guifg': '#f99157'},
    \{'ctermfg': 73,  'guifg': '#62b3b2'},
    \{'ctermfg': 137, 'guifg': '#ab7967'}]

""
"" => buggergator
""
noremap <nowait> <Leader>b :BuffergatorToggle <CR>

""
"" => you complete me
""
let g:ycm_autoclose_preview_window_after_completion=1

""
"" => fuzzy finder
""
let $FZF_DEFAULT_COMMAND='find . '
nnoremap <Leader>o : Files <ENTER> 
set rtp+=~/.fzf/bin/fzf

""
"" => nerd tree
""
map <Leader>n :NERDTreeToggle<CR>
 
"""""""""""""""""""""""""""""""""""""""
"
"
"      NAVIGATION
"
"
"""""""""""""""""""""""""""""""""""""""
 
" disable arrow keys to be extra 1337
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" cycle between split panes
noremap - <c-w>W
noremap = <c-w>W
nnoremap H <c-w>W
nnoremap L <c-w>w

" cycle between tabs
nnoremap _ :tabp <ENTER>
nnoremap + :tabn <ENTER>

" split panes easily
:nnoremap <Leader>v :vnew<CR>
:nnoremap <Leader>h :new<CR>

" new tab
:nnoremap <Leader>t :tabnew<CR>
:nnoremap <Leader>T :tabclose!<CR>

"""""""""""""""""""""""""""""""""""""""
"
"
"      MISC
"
"
"""""""""""""""""""""""""""""""""""""""
 
" delete without saving to clipboard
nnoremap <leader>d "_d

" Sane locations for new split panes
set splitbelow
set splitright

" reload current file
:nnoremap <Leader>r :e!<CR>

" copy current file path to clipboard
:nmap cp :let @+ = expand("%:p")<CR>

" Quickly edit/reload this configuration file
nnoremap ged :e $MYVIMRC<CR>
nnoremap gsr :so $MYVIMRC<CR>

" clipboard register uses system clipboard
set clipboard=unnamed

" cursor can be moved anywhere
set virtualedit=all

" Tab key inserts two spaces and behaves like an indent in atom
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" visual aids for programming
set ruler
set number 

" Switch to previous buffer 
noremap <Leader><Leader> :b#<CR>

" Allow movement with ctrl and hjlk in insert mode
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>

" Quickly resize split panes
" noremap vu :vertical resize +5<CR>
" noremap vd :vertical resize -5<CR>
" noremap hu :resize +5<CR>
" noremap hd :resize -5<CR>

filetype off                  
set nocompatible  
set commentstring=#\ %s
set mouse=a
set noswapfile
syntax enable
inoremap jk <Esc>
let g:ale_set_highlights = 0
filetype plugin indent on 

"""""""""""""""""""""""""""""""""""""""
"
"
"      GIT DIFF COLORS
"
"
"""""""""""""""""""""""""""""""""""""""

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

"""""""""""""""""""""""""""""""""""""""
"
"
"      PREVIEW TAG
"
"
"""""""""""""""""""""""""""""""""""""""

function! PreviewWindowOpened()
    for nr in range(1, winnr('$'))
        if getwinvar(nr, "&pvw") == 1
            return 1
        endif  
    endfor
     return 0
endfun

function! TogglePreview()
  let po=PreviewWindowOpened()
  if po == 1
    :pc
  else
    let l:tag = expand("<cword>")
     execute "ptag " . l:tag
  endif
endfunction

function! ToggleUncertainPreview()
  let po=PreviewWindowOpened()
  if po == 1
    :pc
  else
    let l:tag = expand("<cword>")
     execute "pts " . l:tag
  endif
endfunction

noremap <nowait> <Leader>p :silent call TogglePreview()<CR>
noremap <nowait> <Leader>P :call ToggleUncertainPreview()<CR>

