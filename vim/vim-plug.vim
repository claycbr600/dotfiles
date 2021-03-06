call plug#begin('~/.vim/plugged')

Plug 'buztard/vim-rel-jump'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'claycbr600/vim-buffergator'
Plug 'claycbr600/vim-terraform'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kien/ctrlp.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'machakann/vim-highlightedyank'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'preservim/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'schickling/vim-bufonly'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'unblevable/quick-scope'
Plug 'vim-ruby/vim-ruby'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" :CocInstall coc-snippets
" :CocInstall coc-solargraph
" npm i -g bash-language-server
" npm i -g dockerfile-language-server-nodejs

" ruby text objects
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

call plug#end()
