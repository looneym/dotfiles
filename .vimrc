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
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-commentary'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
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
Plugin 'pseewald/vim-anyfold'
Plugin 'dhruvasagar/vim-zoom'
Plugin 'joukevandermaas/vim-ember-hbs'
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
nnoremap <Space> <Esc>
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
noremap <Leader><Leader> :b#<CR>
noremap <nowait> <Leader>b :BuffergatorToggle <CR>
let g:buffergator_viewport_split_policy="T"
""
"" => you complete me
""
let g:ycm_autoclose_preview_window_after_completion=1

""
"" => fuzzy finder
""
let $FZF_DEFAULT_COMMAND='find . '
nnoremap <Leader>o : Files <ENTER> 
set rtp+=/usr/local/opt/fzf


nnoremap <Leader>f : Ag <ENTER> 
nnoremap <Leader>a : A <ENTER> 
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

" " new tab
" :nnoremap <Leader>t :tabnew<CR>
" :nnoremap <Leader>T :tabclose!<CR>

" "" Quickly resize split panes
" noremap vu :vertical resize +5<CR>
" noremap vd :vertical resize -5<CR>
" noremap hu :resize +5<CR>
" noremap hd :resize -5<CR>


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
"
" :nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
:nnoremap <Leader>s :! echo Running spec: % &&rspec % <CR>
:nnoremap <Leader>S :! echo Running spec:  expand(SpecWithLineNum()) 
" && rspec expand(SpecWithLineNum())<CR>

function! SpecWithLineNum()
  return spec_with_line=join([expand('%'),  line(".")], ':') 
endfun
set splitbelow
set splitright


 " :echo join([expand('%'),  line(".")], ':')

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


" let g:airline_theme='cobalt2'
" let g:airline_powerline_fonts = 1
 let g:ale_set_highlights = 0
let g:tagbar_map_closefold = "r"
let g:tagbar_map_closeallfolds = "R"
:command! Qa qa
" :command Qa! qa!
"
" noremap <nowait> <Leader>p <C-W>}
noremap <Leader>z <C-W>z

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
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap jk <Esc>
