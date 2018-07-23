"
"""""""""""""""""""""""""""""""""""""""
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
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-fugitive'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'metakirby5/codi.vim'
Plugin 'lfv89/vim-interestingwords'
Plugin 'tpope/vim-rails'
Plugin 'ruanyl/vim-gh-line'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'thiagoalessio/rainbow_levels.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'mileszs/ack.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'w0rp/ale'
call vundle#end()     
filetype plugin indent on 


"""""""""""""""""""""""""""""""""""""""
"
"
"      JUNK DRAWER
"
"
"""""""""""""""""""""""""""""""""""""""
function! AddBookmark()
    execute "!" . "add_nerdtree_bookmark" " " . bufname("%")
endfunction

nnoremap <leader>m :call AddBookmark()<cr>
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
" open buffer list in current pane (do not use project drawer"
noremap <Leader><Leader> :BuffergatorToggle <CR>
noremap <nowait> <Leader>bb :BuffergatorToggle <CR>
let g:buffergator_viewport_split_policy="T"
""
"" => you complete me
""
let g:ycm_autoclose_preview_window_after_completion=1

""
"" => fuzzy finder
""
let $FZF_DEFAULT_COMMAND='find . '
nnoremap <Leader>f : Files <ENTER> 
set rtp+=/usr/local/opt/fzf


""
"" => nerd tree
""
" open file exploerer  in current pane (do not use project drawer"
map <Leader>n :NERDTreeToggle<CR>
 

"""""""""""""""""""""""""""""""""""""""
"
"
"      NAVIGATION
"
"
"""""""""""""""""""""""""""""""""""""""

" cycle between split panes
nnoremap - <c-w>W
nnoremap H <c-w>W
nnoremap = <c-w>w
nnoremap L <c-w>w

" cycle between tabs
nnoremap _ :tabp <ENTER>
nnoremap + :tabn <ENTER>

" split panes easily
:nnoremap <Leader>v :vnew<CR>
:nnoremap <Leader>h :new<CR>

" " new tab
" :nnoremap <Leader>t :tabnew<CR>
" :nnoremap <Leader>T :tabclose!<CR>

"" Quickly resize split panes
noremap vu :vertical resize +5<CR>
noremap vd :vertical resize -5<CR>
noremap hu :resize +5<CR>
noremap hd :resize -5<CR>


"""""""""""""""""""""""""""""""""""""""
"
"
"      GENERAL USABILITY STUFF
"
"
"""""""""""""""""""""""""""""""""""""""
 
" delete without saving to clipboard
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" find and replace all isntances of word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

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
"nnoremap <leader><leader> <c-^>

" misc
filetype off                  
set nocompatible  
set commentstring=#\ %s
set mouse=a
set noswapfile
syntax enable

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
"      COLORS AND THEMES
"
"
"""""""""""""""""""""""""""""""""""""""


let g:airline_theme='cobalt2'
let g:airline_powerline_fonts = 1
 let g:ale_set_highlights = 0
