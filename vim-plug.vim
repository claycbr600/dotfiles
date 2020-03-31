call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'unblevable/quick-scope'
Plug 'liuchengxu/vista.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Raimondi/delimitMate'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'honza/vim-snippets'
Plug 'schickling/vim-bufonly'
Plug 'claycbr600/vim-buffergator'
Plug 'szw/vim-tags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'thoughtbot/vim-rspec'
Plug 'hashivim/vim-terraform'

Plug 'martinda/Jenkinsfile-vim-syntax'

" :CocInstall coc-snippets
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" ruby text objects
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

call plug#end()
