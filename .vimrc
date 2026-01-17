" Vim Config file 

"Enables syntax highlighting
syntax on
 
" Enables <line number> and <relative line numbers> 
set number relativenumber

highlight LineNrAbove ctermfg=DarkGrey
highlight LineNrBelow ctermfg=LightGreen
highlight CursorLineNr ctermfg=White


" set comment color to light blue" 
hi Comment ctermfg=LightBlue guifg=#80a0ff

" Maps kj to Escape key (used to be C-q until that started hurting :|| )
inoremap kj <Esc>
inoremap jk <Esc>
inoremap <C-q> <Esc>


" Removes the arrow key functionality in all modes
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

" On pressing tab, insert 4 spaces
set expandtab

" Makes the Tab and Backspace keys work as 4 spaces
set softtabstop=4


if has('termguicolors')
  set termguicolors
endif


" Optional: enable file type specific indentation
" filetype plugin indent on

" Autoload vim-plug "
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" End vim-plug script "


"" Polyglot syntax highlighting plugin
set nocompatible

" Begin List of plugins
call plug#begin()
" Plugin Manager
Plug 'junegunn/vim-plug'

"" Syntax parsing plugin
Plug 'sheerun/vim-polyglot'

"" Jetbrains Theme Plugin
Plug 'devsjc/vim-jb'

" Darcula Theme
Plug 'doums/darcula'



" End List of plugins
call plug#end()



"source ~/.vim/plugged/vim-jb/colors/jb.vim




"" ######### Lines that ask to be at the bottom (add plugin name and their github page where it asks to be at bottom for future troubleshooting)

" vim-jb : JetBrains theme plugin
" https://github.com/devsjc/vim-jb

if has('termguicolors')
  set termguicolors
endif
"let g:java_ignore_markdown=1
"let g:jb_style='dark'
"colorscheme jbcolorscheme jb
"call darcula#Hi('markdownId', [ '#000000', 16 ])
colorscheme darcula
call darcula#Hi('markdownId', [ '#000000', 16 ])
call darcula#Hi('markdownLineStart', [ '#000000', 16 ])
call darcula#Hi('markdownH1', [ '#000000', 16 ])
call darcula#Hi('markdownH2', [ '#000000', 16 ])
call darcula#Hi('markdownHeadingRule', [ '#000000', 16 ])
call darcula#Hi('markdownRule', [ '#000000', 16 ])
call darcula#Hi('markdownCode', [ '#000000', 16 ])
call darcula#Hi('markdownCodeBlock', [ '#000000', 16 ])
call darcula#Hi('markdownIdDeclaration', [ '#000000', 16 ])
call darcula#Hi('background', [ '#FFFFFF', 16 ])
highlight Normal ctermbg=black
" To change background to black, go to
" /.vim/plugged/darcula/colors/darcula.vim
highlight Normal ctermbg=black

"Enables syntax highlighting
syntax on
 
" Enables <line number> and <relative line numbers> 
set number relativenumber

highlight LineNrAbove ctermfg=DarkRed
highlight LineNrBelow ctermfg=LightGreen
highlight CursorLineNr ctermfg=White
