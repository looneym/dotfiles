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
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
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
Plug 'wincent/vim-clipper'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-tbone'
Plug 'fatih/vim-go'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'TheJefe/vim-prreview'
Plug 'majutsushi/tagbar'
call plug#end()

"""""""""""""""""""""""""""""""""""""""
"
"
"      CONFIGURE PLUGINS
"
"
"""""""""""""""""""""""""""""""""""""""
let g:bookmark_disable_ctrlp = 1
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \}
let  g:ale_fix_on_save=1
au BufWritePost * if getline(1) =~ "^#!.*sh" | let b:ale_fixers=  ['shfmt', 'remove_trailing_lines', 'trim_whitespace']
au BufWritePost * if getline(1) =~ "^#!.*sh" | let b:ale_fix_on_save=1 
map <leader>as :ALEFix shfmt<cr>
map <leader>as :ALEFix shfmt<cr>

map <leader>g :Git!


set pastetoggle=<F2>

let g:go_fmt_command = "goimports"
let g:buffergator_autoupdate = 1
let g:buffergator_autodismiss_on_select = 0

let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'
" nnoremap r :VtrOpenRunner<CR>
" nnoremap fr :VtrFocusRunner<CR>
" nnoremap scr :VtrSendCommandToRunner!
" nnoremap rsl:VtrSendLinesToRunner<CR>
" " vnoremap slr :VtrSendLinesToRunner<CR>
" " xnoremap slr :VtrSendLinesToRunner<CR>
" nnoremap rk :VtrKillRunner<CR>
let g:ale_echo_cursor = 1
colorscheme Tomorrow-Night-Eighties
let g:airline_theme='tomorrow'
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_error = ''
let g:airline_section_warning = ''

call clipper#set_invocation('nc localhost 8377')


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

noremap <nowait> <Leader>b :BuffergatorOpen <CR>
let g:buffergator_viewport_split_policy="R"


"" you complete me
let g:ycm_autoclose_preview_window_after_completion=1

"" fuzzy finder
let $FZF_DEFAULT_COMMAND='find . '
nnoremap <Leader>o : Files <ENTER>
nnoremap <Leader>b : Buffers <ENTER>
map <Leader>s :Ag<CR>
let g:buffergator_suppress_keymaps=1


vnoremap <Leader>sort d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" nnoremap <C-u> :res +10 <CR>
" nnoremap <C-i> :res -10  <CR>
" nnoremap <C-y> :vertical-resize -10 <CR>
" nnoremap <C-o> :vertical-resize +10  <CR>

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

map <Leader>n :NERDTreeToggle<CR>
map <Leader>gh :OpenGithub<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>c gc1<CR>
map <Leader>, <<CR>
map <Leader>. ><CR>

"""""""""""""""""""""""""""""""""""""""
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

noremap fu :h fugitive-mappings<cr>
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
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap bg :sus<CR>
" tnoremap jk  <C-\><C-n>

tnoremap <C-w>h <C-\><C-n><C-w>h

tnoremap <C-w>j <C-\><C-n><C-w>j

tnoremap <C-w>k <C-\><C-n><C-w>k

tnoremap <C-w>l <C-\><C-n><C-w>l
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
" nnoremap p :do FocusGained<cr> p
" xnoremap p :do FocusGained<cr> p 
"  " nnoremap P :do FocusGained<cr> P
" " xnoremap P :do FocusGained<cr> P 
" cursor can be moved anywhere
set virtualedit=all

set cursorline
set cursorcolumn

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
" cnoremap jk <Esc>
" vnoremap jk <Esc>
let g:ale_set_highlights = 1
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
 fun! Runcmd(cmd)
    silent! exe "noautocmd botright pedit ".a:cmd
    noautocmd wincmd P
    set buftype=nofile
    exe "noautocmd r! ".a:cmd
    noautocmd wincmd p
endfun
com! -nargs=1 Runcmd :call Runcmd("<args>")

map <Leader>glo :Runcmd git log --oneline --reverse <CR>
" set incsearch
" set hlsearch
