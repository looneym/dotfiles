"""""""""""""""""""""""""""""""""""""""
"
"
"      INSTALL PLUGINS
"
"
"""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tpope/vim-rails'
Plug 'lfv89/vim-interestingwords'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'pseewald/vim-anyfold'
Plug 'dhruvasagar/vim-zoom'
Plug 'mhinz/vim-signify'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'k0kubun/vim-open-github'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'Shougo/denite.nvim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""
"
"
"      CONFIGURE PLUGINS
"
"
"""""""""""""""""""""""""""""""""""""""
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
" nnoremap r :VtrOpenRunner<CR>
" nnoremap fr :VtrFocusRunner<CR>
" nnoremap scr :VtrSendCommandToRunner! 
" nnoremap rsl:VtrSendLinesToRunner<CR>
" " vnoremap slr :VtrSendLinesToRunner<CR>
" " xnoremap slr :VtrSendLinesToRunner<CR>
" nnoremap rk :VtrKillRunner<CR>
let g:ale_echo_cursor = 0
colorscheme Tomorrow-Night-Eighties
let g:airline_theme='tomorrow'
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

"" rainbow levels
map <leader>l :RainbowLevelsToggle<cr>
let g:rainbow_levels = [
    \{'ctermfg': 68,  'guifg': '#6699cc'},
    \{'ctermfg': 203, 'guifg': '#ec5f67'},
    \{'ctermfg': 221, 'guifg': '#fac863'},
    \{'ctermfg': 114, 'guifg': '#99c794'},
    \{'ctermfg': 176, 'guifg': '#c594c5'},
    \{'ctermfg': 209, 'guifg': '#f99157'},
    \{'ctermfg': 73,  'guifg': '#62b3b2'},
    \{'ctermfg': 137, 'guifg': '#ab7967'}]

"" buggergator
noremap <nowait> <Leader>b :BuffergatorToggle <CR>
let g:buffergator_viewport_split_policy="T"

"" you complete me
let g:ycm_autoclose_preview_window_after_completion=1

"" fuzzy finder
let $FZF_DEFAULT_COMMAND='find . '
nnoremap <Leader>o : Files <ENTER> 
map <Leader>s :Ag<CR>

function! s:getVisualSelection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)

    if len(lines) == 0
        return ""
    endif

    let lines[-1] = lines[-1][:column_end - (&selection == "inclusive" ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]

    return join(lines, "\n")
endfunction
noremap <leader>f :Ag <C-r>=expand('<cword>')<CR> <CR>
vnoremap <silent><leader>f <Esc>:Ag! <C-R>=<SID>getVisualSelection()<CR><CR>

map <Leader>n :NERDTreeToggle<CR>
map <Leader>gh :OpenGithub<CR>

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

" split panes easily
:nnoremap <Leader>v :vnew<CR>
:nnoremap <Leader>h :new<CR>

" new tab
:nnoremap <Leader>t :tabnew<CR>
:nnoremap <Leader>T :tabclose!<CR>


nnoremap <space> :
nnoremap <leader>w :w<CR>
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
xnoremap y "+y
xnoremap Y "+Y

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
cnoremap jk <Esc>
vnoremap jk <Esc>
let g:ale_set_highlights = 0
filetype plugin indent on 
xnoremap p pgvy

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

" set incsearch
" set hlsearch

