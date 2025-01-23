set clipboard+=unnamed
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

if has("ide")
	" Highlight yanked text
	Plug 'machakann/vim-highlightedyank'
	let g:highlightedyank_highlight_duration = "200"
	let g:highlightedyank_highlight_color = "rgba(250, 240, 170, 128)"
endif

"=== Colemak Mod-DHM ===
 
"Colemak mnei(hjkl) t(i) <C-n>(f) <C-e>(e)
"noremap m h|        
"noremap n gj|       
"noremap e gk|      
"noremap i l|        
"noremap t i| 
"noremap T I|      
"noremap E e|
"noremap h n| 
"noremap k N|
"noremap <C-m> m|
 
"noremap <C-n> <C-f>| "Page down
"noremap <C-e> <C-b>H| "Page up, cursor up
 
" make easymotion match the new mnei(hjkl) motions
"map <Leader>m <Plug>(easymotion-linebackward)
"map <leader>n <Plug>(easymotion-j)
"map <leader>e <Plug>(easymotion-k)
"map <Leader>i <Plug>(easymotion-lineforward)
 
" below: not remapping, just fixing sequences:
" fix (i)nner and (t)ill, e.g. (c)hange (i)n (w)ord
"nnoremap ci ci|
"nnoremap di di|
"nnoremap vi vi|
"nnoremap yi yi|
"nnoremap ct ct|
"nnoremap dt dt|
"nnoremap vt vt|
"nnoremap yt yt|