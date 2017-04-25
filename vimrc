set autoindent
set cindent
set expandtab
set hidden
set ignorecase
set incsearch
set number
set pastetoggle=<F2>
set ruler
set shiftround
set shiftwidth=2
set smartcase
set splitbelow
set splitright
set tabstop=2

set nocompatible                " running vim, not vi
source ~/.dotfiles/vundle.vim   " manage vim bundles
syntax on                       " enable syntax highlighting

autocmd BufNewFile,BufRead *.es6 set filetype=javascript

" disable automatic comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" mapleader
let mapleader = "\<Space>"

" remap common triggers
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
imap jk <Esc>

" auto center on matched string
noremap n nzz
noremap N Nzz

" stop deleting spacing on empty lines
inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>

" yank
nnoremap Y y$

" write
function SudoWrite()
  write !sudo tee % > /dev/null
endfunction
cabbrev sudow <ESC>:call SudoWrite()

" copy to clipboard
vmap <Leader>y "*y
vmap <Leader>d "*d
nmap <Leader>p "*p

" movement
nnoremap <CR> zt
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

" buffers
nnoremap <Leader>b :ls<CR>:b<Space>
nnoremap <Leader>d :ls<CR>:bd<Space>
nnoremap <Leader>o :BufOnly<CR>
nnoremap <Leader>a <C-^>

" window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" window resizing
nnoremap <Leader>x <C-W><Bar>
nnoremap <Leader>y <C-W>_
nnoremap <Leader>z <C-W>=

" tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
nnoremap <Leader>0 10gt

" netrw
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
cnoremap %% <C-R>=fnamemodify(expand('%:h'), ':~:.').'/'<CR>
map <Leader>ew :e %%<CR>
map <Leader>es :sp %%<CR>
map <Leader>ev :vsp %%<CR>
map <Leader>et :tabe %%<CR>

" set line numbers for editor windows
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" ctrlp
" silver searcher
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " use ag in ctrlp for listing files. lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that ctrlp doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
  \ }
endif
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" tags
" ctags -R --languages=ruby -f .tags --exclude=.git --exclude=log . $(bundle list --paths)
set tags=.tags
let g:autotagTagsFile=".tags"
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
vnoremap g<C-]> <C-]>

" tagbar
nmap <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_sort = 1

" ultisnips 
let g:UltiSnipsExpandTrigger="<tab>"                                            
let g:UltiSnipsJumpForwardTrigger="<tab>"                                       
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-l>"

" youcompleteme
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" easymotion
map <Leader><Leader> <Plug>(easymotion-prefix)
