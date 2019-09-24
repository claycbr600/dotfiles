filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'
Plugin 'unblevable/quick-scope'
Plugin 'majutsushi/tagbar'
Plugin 'Raimondi/delimitMate'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'schickling/vim-bufonly'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'szw/vim-tags'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner'
Plugin 'thoughtbot/vim-rspec'
Plugin 'hashivim/vim-terraform'
" ruby text objects
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"   auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
