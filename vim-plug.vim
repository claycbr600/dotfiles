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
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'schickling/vim-bufonly'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'szw/vim-tags'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'thoughtbot/vim-rspec'
Plug 'hashivim/vim-terraform'

Plug 'martinda/Jenkinsfile-vim-syntax'

" code completion # requires nodejs
" cd .vim/bundle/coc.nvim && ./install.sh nightly
" :CocInstall coc-ultisnips
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" ruby text objects
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

call plug#end()
