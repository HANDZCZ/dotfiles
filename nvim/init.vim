set ruler
set relativenumber
set nu
set mouse=a
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
"set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set colorcolumn=100
set cmdheight=2
set updatetime=50
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set spelllang=cs,en

call plug#begin('~/.vim/plugged')
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'matze/vim-move'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
Plug 'mhinz/vim-startify'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
call plug#end()

" Startify
let g:startify_enable_special = 0
let g:startify_session_persistence = 1
let g:startify_fortune_use_unicode = 1
let g:startify_change_to_vcs_root = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_autoload = 1
let g:startify_session_dir = '~/.vim/sessions/'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'c': '~/.config/' },
            \ { 'v': '~/.config/nvim/init.vim' },
            \ { 's': '~/.bashrc' },
            \ ]

" rnvimr
let g:rnvimr_ex_enable = 1

" vim-move
let g:move_key_modifier = 'C'

" Color scheme
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

let mapleader = " "
let maplocalleader = "\\"
"inoremap <silent><expr> <TAB>
"            \ pumvisible() ? "\<C-n>" :
"            \ <SID>check_back_space() ? "\<TAB>" :
"            \ coc#refresh()

"command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

" Explorer
let g:coc_explorer_global_presets = {
\   'neovim': {
\     'root-uri': '~/.config/nvim',
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'
let g:floaterm_keymap_kill   = '<F5>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
 
" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}
" Define a separator
let g:which_key_sep = '→'
" set timeoutlen=100
let g:which_key_timeout = 1000

" Not a fan of floating windows for this
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map['r'] = [':RnvimrToggle', 'ranger']
let g:which_key_map['e'] = [':CocCommand explorer --open-action-strategy tab', 'explorer']
let g:which_key_map['f'] = [':CocCommand explorer --preset floating --open-action-strategy tab', 'floating-explorer']
let g:which_key_map['u'] = [':UndotreeToggle', 'undo-tree']
let g:which_key_map['l'] = {
            \ 'name' : '+lsp',
            \ 'g' : {
              \ 'name' : '+goto',
              \ 'd' : ['<Plug>(coc-definition)', 'definition'],
              \ 'y' : ['<Plug>(coc-type-definition)', 'type-definition'],
              \ 'i' : ['<Plug>(coc-implementation)', 'implementation'],
              \ 'r' : ['<Plug>(coc-references)', 'references'],
              \ 'h' : ['<Plug>(coc-diagnostic-next)', 'next-diagnostic'],
              \ 'l' : ['<Plug>(coc-diagnostic-prev)', 'prev-diagnostic'],
              \ 'n' : ['<Plug>(coc-diagnostic-next-error)', 'next-error'],
              \ 'p' : ['<Plug>(coc-diagnostic-prev-error)', 'prev-error']
              \ },
            \ 'r' : ['<Plug>(coc-rename)', 'rename'],
            \ 'R' : [':CocRestart', 'restart']
            \ }

let g:which_key_map['g'] = {
            \ 'name' : '+git',
            \ 's' : [':G', 'status'],
            \ 'h' : [':diffget //2', 'left-diff'],
            \ 'l' : [':diffget //3', 'right-diff']
            \ }

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'q' : ['<C-W>c'     , 'close']         ,
      \ '-' : ['<C-W>s'     , 'split-horizontal']    ,
      \ '|' : ['<C-W>v'     , 'split-vertical']    ,
      \ 'h' : ['<C-W>h'     , 'left']           ,
      \ 'j' : ['<C-W>j'     , 'below']          ,
      \ 'l' : ['<C-W>l'     , 'right']          ,
      \ 'k' : ['<C-W>k'     , 'up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-left']    ,
      \ 'J' : ['resize +5'  , 'expand-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-right']   ,
      \ 'K' : ['resize -5'  , 'expand-up']      ,
      \ '=' : ['<C-W>='     , 'balance']
      \ }

let g:which_key_map['t'] = {
      \ 'name' : '+terminal' ,
      \ ';' : [':FloatermNew --wintype=popup --height=6'        , 'terminal'],
      \ 'f' : [':FloatermNew fzf'                               , 'fzf'],
      \ 'g' : [':FloatermNew lazygit'                           , 'git'],
      \ 'd' : [':FloatermNew lazydocker'                        , 'docker'],
      \ 'p' : [':FloatermNew python'                            , 'python'],
      \ 'r' : [':FloatermNew ranger'                            , 'ranger'],
      \ 't' : [':FloatermToggle'                                , 'toggle'],
      \ 'y' : [':FloatermNew ytop'                              , 'ytop'],
      \ 's' : [':FloatermNew ncdu'                              , 'ncdu'],
      \ }

let g:which_key_map['s'] = {
            \ 'name' : '+session',
            \ 'l' : [':SLoad', 'load'],
            \ 's' : [':SSave', 'save'],
            \ 'd' : [':SDelete', 'delete'],
            \ 'q' : [':SClose', 'close']
            \ }

" Register which key map
call which_key#register('<Space>', "g:which_key_map")

let g:pandoc#syntax#conceal#use = 0
let g:markdown_folding = 1
"let g:pandoc#modules#disabled = ["folding"]
