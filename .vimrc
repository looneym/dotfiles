" misc
filetype off                  
set nocompatible  
set commentstring=#\ %s
set mouse=a
set noswapfile

" Plugin management 
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
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'lfv89/vim-interestingwords'
Plugin 'dsawardekar/ember.vim'
Plugin 'dsawardekar/portkey'
Plugin 'tpope/vim-rails'
call vundle#end()     
filetype plugin indent on 

let g:airline_theme='cobalt2'
let g:airline_powerline_fonts = 1
set filetype=hbs syntax=mustache 
" delete without saving to clipboard
nnoremap <leader>d "_d
vnoremap <leader>d "_d
vnoremap <leader>p "_dP

" find and replace all isntances of word under cursor
:nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" split panes easily
:nnoremap <Leader>v :vnew<CR>
:nnoremap <Leader>h :new<CR>

" new tab
:nnoremap <Leader>t :tabnew<CR>
:nnoremap <Leader>T :tabclose!<CR>

:nnoremap <Leader>r :e!<CR>

let g:ycm_autoclose_preview_window_after_completion=1

" fuzzy finder plugin connfig 
let $FZF_DEFAULT_COMMAND='find . '
nnoremap F : Files <ENTER> 

" visual aids for programming
syntax enable
set ruler

" Quickly edit/reload this configuration file
nnoremap ged :e $MYVIMRC<CR>
nnoremap gsr :so $MYVIMRC<CR>

"" Quickly resize split panes
noremap vu :vertical resize +5<CR>
noremap vd :vertical resize -5<CR>
noremap hu :resize +5<CR>
noremap hd :resize -5<CR>

" clipboard register uses system clipboard
set clipboard=unnamed

" cursor can be moved anywhere
set virtualedit=all

" Tab key inserts two spaces and behaves like an indent in atom
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" NERDTree config
let NERDTreeShowBookmarks=1

" location + config of fuzzy finder plugin 
set rtp+=/usr/local/opt/fzf
let $FZF_DEFAULT_COMMAND='find .' 

" key mappings
map <C-n> :NERDTreeToggle<CR>
nnoremap ^ $ 
nnoremap $ ^ <left>
nnoremap & # 
" cycle between split panes
nnoremap - <c-w>W
nnoremap H <c-w>W
nnoremap = <c-w>w
nnoremap L <c-w>w
" cycle between tabs
nnoremap _ :tabp <ENTER>
nnoremap + :tabn <ENTER>

autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue
autocmd InsertLeave * highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue

":autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
