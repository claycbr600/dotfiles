set autoindent
set backspace=indent,eol,start
set cindent
set expandtab
set foldlevel=2
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

set nocompatible                " running vim, not vi
source ~/.vim/vim-plug.vim      " manage vim bundles
syntax on                       " enable syntax highlighting

" autocmd
au FileType eruby.yaml setlocal commentstring=#\ %s
au FileType Jenkinsfile setlocal commentstring=//\ %s
au BufNewFile,BufRead Jenkinsfile* setf Groovy
au BufNewFile,BufRead Dockerfile,Dockerfile.*,*.Dockerfile setf dockerfile

set cursorline
hi clear CursorLine
hi CursorLineNr term=bold cterm=bold ctermfg=012 gui=bold
hi Error None
" make error texts have a red color
hi CocErrorHighlight ctermfg=Red  guifg=#ff0000
hi CocErrorSign guifg=#d1666a
hi CocHintSign guifg=Blue
set guicursor=a:block-blinkon10
" hi CocInfoSign guibg=#353b45
" hi CocWarningSign guifg=#d1cd66

let g:highlightedyank_highlight_duration = 300
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
" del to null register
nnoremap Y y$
nnoremap yp "0p
nnoremap yP "0P
nnoremap <Leader>k "_d

" copy to clipboard
vmap <Leader>y "*y
vmap <Leader>d "*d
nnoremap <Leader>p "*p

" movement
nnoremap <CR> zt
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap $ g$
nnoremap ^ g^

" buffers
let g:buffergator_suppress_keymaps = 1
nnoremap <Leader>b :BuffergatorOpen<CR>
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
" map <Leader>ef :call UltiSnips#RefreshSnippets()<CR>
map <Leader>ew :e %:h<CR>
map <Leader>es :sp %:h<CR>
map <Leader>ev :vs %:h<CR>
map <Leader>et :tabe %:h<CR>

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

" tags
let g:vim_tags_ctags_binary = '/usr/local/bin/ctags'
let g:vim_tags_ignore_files = ['.gitignore', expand('$HOME/.tagsignore')]
nnoremap <C-]> g<C-]>
vnoremap <C-]> g<C-]>
nnoremap g<C-]> <C-]>
vnoremap g<C-]> <C-]>

" status line
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'right': [
  \     ['percent'],
  \     ['lineinfo'],
  \     ['filetype']
  \   ]
  \ }
\ }

" tagbar
let g:tagbar_autoclose = 1
nnoremap <Leader>t :TagbarToggle<CR>

" coc.nvim
inoremap <silent><expr> <TAB>
\ pumvisible() ? coc#_select_confirm() :
\   coc#expandableOrJumpable() ?
\   "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\   <SID>check_back_space() ? "\<TAB>" :
\   coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<TAB>'
imap <C-O> <Esc>:call coc#util#float_hide()<CR>a

" vim-go
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = "goimports"

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
