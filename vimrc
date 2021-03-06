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
Plug 'MattesGroeger/vim-bookmarks'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}

Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
  let g:go_fmt_command = "goimports"

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let $FZF_DEFAULT_COMMAND='find . '
  nnoremap <Leader>o : Files <ENTER>
  nnoremap <Leader>b : Buffers <ENTER>
  map <Leader>s :Ag<CR>

Plug 'lfv89/vim-interestingwords'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

Plug 'scrooloose/nerdtree'
  map <Leader>n :NERDTreeToggle<CR>

Plug 'thiagoalessio/rainbow_levels.vim'
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

Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
  noremap fu :h fugitive-mappings<cr>
  map <leader>G :Git! 
  map <Leader>gs :Gstatus<CR>
  map <Leader>gy :Git! yeet

Plug 'tpope/vim-rails'
Plug 'tpope/vim-tbone'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='tomorrow'
  let g:airline_section_b = ''
  let g:airline_section_y = ''
  let g:airline_section_error = ''
  let g:airline_section_warning = ''

Plug 'w0rp/ale'
  let g:ale_fixers = {
    \   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \}
  let  g:ale_fix_on_save=1
  au BufWritePost * if getline(1) =~ "^#!.*sh" | let b:ale_fixers=  ['shfmt', 'remove_trailing_lines', 'trim_whitespace']
  au BufWritePost * if getline(1) =~ "^#!.*sh" | let b:ale_fix_on_save=1 
  map <leader>as :ALEFix shfmt<cr>
  map <leader>as :ALEFix shfmt<cr>
  let g:ale_echo_cursor = 1
  let g:ale_set_highlights = 1

Plug 'wincent/vim-clipper'
Plug 'mhinz/vim-signify'
Plug 'ruanyl/vim-gh-line'
let g:gh_open_command = 'fn() { echo "$@" | nc 10.0.0.2 8377; }; fn '



Plug 'ycm-core/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3  install.py --clang-completer' }
  let g:ycm_autoclose_preview_window_after_completion=1

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
  let g:mkdp_port = '1337'
Plug 'ferrine/md-img-paste.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""
"
"
"      CUSTOM FUNCTIONS AND COMMANDS
"
"
"""""""""""""""""""""""""""""""""""""""
 
" search a visual selection with ag
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
nnoremap <silent><leader>f viw<Esc>:Ag! <C-R>=<SID>getVisualSelection()<CR><CR>
vnoremap <silent><leader>f <Esc>:Ag! <C-R>=<SID>getVisualSelection()<CR><CR>

" git stuff
map <Leader>glo :Runcmd git log --oneline --reverse <CR>

" sort a visual selection, split by word
vnoremap <Leader>sort d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

""""""""""""""""""""""""""""""""""""""
"
"
"      NAVIGATION
"
"
"""""""""""""""""""""""""""""""""""""""

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

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

" Switch to previous buffer
noremap <Leader><Leader> :b#<CR>

" Allow movement with ctrl and hjlk in insert mode
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>

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
"      PLUGIN CONFIGURATION
"
"
"""""""""""""""""""""""""""""""""""""""
" some plugins cannot be configured inside the Plug block

colorscheme Tomorrow-Night-Eighties
call clipper#set_invocation('nc 10.0.0.2 8377')

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

" Tab key inserts two spaces and behaves like an indent in atom
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" allow cursor to be moved anywhere in insert
set virtualedit=all

" visual aids for programming
set ruler
set number
" set number relativenumber

" misc
set nocompatible
set mouse=a
set noswapfile
syntax enable
inoremap jk <Esc>
filetype plugin indent on
set pastetoggle=<F2>
nnoremap <space> :
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap bg :sus<CR>
nnoremap <leader>h :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <leader>H :nohl<CR>


