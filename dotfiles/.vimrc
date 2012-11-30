" Highlight search terms
set hlsearch
" Allow hiding modified buffers
set hidden

" Ignore case sensitivity in searches
set ignorecase

" Searches for lowercase words match in any case, mixed case searches turn on case sensitivity
set smartcase

" Indent code properly
set smartindent

" Set syntax highlighting on
syntax on

" Show line numbers
set number
" Highlight current line
set cursorline
" Set tabs to 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Use vividchalk color scheme
colorscheme vividchalk

" Use pathogen for auto-loading vim plugins
call pathogen#infect()
filetype plugin indent on

" Ruby autocomplete
"ruby
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
""improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold
