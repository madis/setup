" Highlight search terms
set hlsearch

" Ignore case sensitivity in searches
set ignorecase

" Searches for lowercase words match in any case, mixed case searches turn on case sensitivity
set smartcase

" Indent code properly
set smartindent

" Set syntax highlighting on
syntax on

" Show line numbers
:set number

" Set tabs to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Use vividchalk color scheme
colorscheme vividchalk

" Use pathogen for auto-loading vim plugins
call pathogen#infect()
filetype plugin indent on

