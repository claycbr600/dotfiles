set autoindent
set cindent
set expandtab
set hidden
set ignorecase
set incsearch
set number relativenumber
set pastetoggle=<F2>
set ruler
set shiftround
set shiftwidth=2
set smartcase
set splitbelow
set splitright
set tabstop=2
set backspace=indent,eol,start

set nocompatible                " running vim, not vi
source ~/.vim/vundle.vim        " manage vim bundles
syntax on                       " enable syntax highlighting

autocmd FileType groovy UltiSnipsAddFiletypes java
autocmd BufNewFile,BufRead Jenkinsfile set filetype=groovy
autocmd FileType eruby.yaml setlocal commentstring=#\ %s
hi CursorLineNr term=bold cterm=bold ctermfg=012 gui=bold

let g:go_highlight_trailing_whitespace_error=0

" matchit - jump between matching keywords
runtime macros/matchit.vim

" disable automatic comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" mapleader
let mapleader = "\<Space>"

" remap common triggers
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
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

" copy to clipboard
vmap <Leader>y "*y
vmap <Leader>d "*d
nnoremap <Leader>p "*p
nnoremap <Leader>k "+P

" movement
nnoremap <CR> zt
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

" buffers
nnoremap <Leader>o :BufOnly<CR>
nnoremap <Leader>a <C-^>

" window movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
map <Leader>ew :e .<CR>
map <Leader>es :sp .<CR>
map <Leader>ev :vs .<CR>
map <Leader>et :tabe .<CR>

" set line numbers for editor windows
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

" auto rebalance window on vim resize
autocmd VimResized * :wincmd =

" window resizing
nnoremap <Leader>z :wincmd _<cr>:wincmd \|<cr>
nnoremap <Leader>= :wincmd =<cr>

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

" ctags
let g:vim_tags_ignore_files = ['.gitignore', expand('$HOME/.tagsignore')]
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
vnoremap g<C-]> <C-]>

" tagbar
nmap <silent> <Leader>t :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_sort = 1

" ultisnips
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsListSnippets='<c-l>'

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

" buffergator
let g:buffergator_suppress_keymaps=1
nnoremap <silent> <Leader>b :BuffergatorToggle<CR>

" quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" VTR: vim tmux runner
nnoremap <Leader>ra :VtrReattachRunner<CR>
nnoremap <Leader>rp :VtrAttachToPane<CR>
nnoremap <Leader>rc :VtrClearRunner<CR>
nnoremap <Leader>rd :VtrDetachRunner<CR>
nnoremap <Leader>ru :VtrFlushCommand<CR>
nnoremap <Leader>rf :VtrFocusRunner<CR>
nnoremap <Leader>rk :VtrKillRunner<CR>
nnoremap <Leader>ro :VtrOpenRunner { 'orientation': 'v', 'percentage': 22 }<CR>
nnoremap <Leader>rr :VtrReorientRunner<CR>
nnoremap <Leader>rs :VtrSendCommandToRunner<CR>
nnoremap <Leader>rl :VtrSendLinesToRunner<CR>
vnoremap <Leader>rl :VtrSendLinesToRunner<CR>

" rspec
let g:rspec_command = "call VtrSendCommand('spec {spec}')"
nnoremap <Leader>sf :call RunCurrentSpecFile()<CR>
nnoremap <Leader>sn :call RunNearestSpec()<CR>
nnoremap <Leader>sl :call RunLastSpec()<CR>
nnoremap <Leader>sa :call RunAllSpecs()<CR>
