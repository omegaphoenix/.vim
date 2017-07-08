set t_Co=256
set background=dark

""" Start Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

""" Plugins
" Tools
Plugin 'chriskempson/base16-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'godlygeek/tabular'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mitermayer/vim-prettier'

" Languages
Plugin 'scrooloose/syntastic'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
Plugin 'fatih/vim-go'
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'yosssi/vim-ace'
Plugin 'wavded/vim-stylus'
Plugin 'cespare/vim-toml'
Plugin 'hashivim/vim-terraform'
Plugin 'elmcast/elm-vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Bundle 'chase/vim-ansible-yaml'
Bundle 'leafo/moonscript-vim'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()
filetype plugin indent on
""" End Vundle

" file types
au BufRead,BufNewFile *.json.ejs set filetype=json
au BufRead,BufNewFile *.ctmpl set filetype=gotexttmpl
au BufRead,BufNewFile *.dockerfile set filetype=dockerfile

let g:syntastic_mode_map = { 'passive_filetypes': ['coffee'] }
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 0
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

let g:prettier#exec_cmd_async = 1
" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 100
" number of spaces per indentation level
let g:prettier#config#tab_width = 2
" use tabs over spaces
let g:prettier#config#use_tabs = 'false'
" print semicolons
let g:prettier#config#semi = 'true'
" single quotes over double quotes
let g:prettier#config#single_quote = 'true'
" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'
" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true'
" none|es5|all
let g:prettier#config#trailing_comma = 'all'
" flow|babylon|typescript|postcss
let g:prettier#config#parser = 'flow'


let g:Tex_DefaultTargetFormat = 'pdf'

" vimrc settings
let g:rbpt_loadcmd_toggle = 1

syntax enable

vnoremap <leader>p "_dP
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

set number
highlight LineNr ctermfg=DarkGrey

set ai
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smarttab
retab

set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrap
set incsearch

set ttyfast
set lazyredraw

set backspace=indent,eol,start

function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction



function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

vnoremap <silent> <expr> p <sid>Repl()

" tabs
nnoremap tt :tabnew<CR>
nnoremap tp :tabprev<CR>
nnoremap tn :tabnext<CR>

" Always show statusline
set laststatus=2

" Autofix whitespace
:autocmd BufWritePost * :FixWhitespace

highlight SignColumn ctermbg=none

" Airline - status/tabline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Tabular
noremap ta :Tab /=<CR>
noremap ts :Tab/:\zs /l0<CR>

" Go
let g:go_fmt_command = "goimports"
set completeopt-=preview

" Indents
au FileType c setl sw=4 sts=4 et
au FileType cpp setl sw=4 sts=4 et
au FileType S setl sw=8 sts=8 et
au FileType java setl sw=4 sts=4 et
au FileType python setl sw=4 sts=4 et

augroup myvimrc
 au!
 au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" Highlight lines over 80 characters
set cc=80

" Automatically format Elm code
let g:elm_format_autosave = 1

set tabstop=2 shiftwidth=2 expandtab
