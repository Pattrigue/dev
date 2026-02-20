se foldmethod=manual
set clipboard=unnamed,unnamedplus
nnoremap <Home> _
set ignorecase
xnoremap p "_dP

noremap ; :
nnoremap <BS> <C-^>
set scrolloff=5

nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Enable syntax highlighting + filetype detection
syntax on
filetype plugin indent on

" Enable truecolor
set termguicolors

" Trim whitespace
nnoremap <Leader>rws :%s:\s\+$::<CR>:let @/=''<cr>

" Do incremental searching
set incsearch

" Select what was just pasted
nnoremap <Leader>V V`]

" Normal mode j k remapping
nnoremap j k
nnoremap k j
nnoremap gj gk
nnoremap gk gj

" Visual mode j k remapping
vnoremap j k
vnoremap k j
vnoremap gj gk
vnoremap gk gj

" Operator-pending mode j k remapping
onoremap j k
onoremap k j
onoremap gj gk
onoremap gk gj

" Yank highlight settings
let g:highlightedyank_highlight_duration = 200
let g:highlightedyank_highlight_color = "rgba(250, 240, 170, 128)"

if has("ide")
  Plug 'machakann/vim-highlightedyank'
endif
