set nocompatible              " be iMproved, required
filetype off                  " required for Vundle, turned back of after Vundle stuff


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme type stuff
"
syntax on
set background=dark
colorscheme distinguished


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Leader
"
let mapleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""   VUNDLE 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	"call vundle#begin('~/some/path/here')

	" let Vundle manage Vundle, required
	Plugin 'gmarik/Vundle.vim'

	" The following are examples of different formats supported.
	" Keep Plugin commands between vundle#begin/end.
	"
	" plugin on GitHub repo
	Plugin 'tpope/vim-fugitive'
	Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-abolish'
  Plugin 'jiangmiao/auto-pairs'

  Plugin 'tmux-plugins/vim-tmux'

  Plugin 'itchyny/lightline.vim'
  "Make gvim-only colorschemes work transparently in terminal vim 
  Plugin 'godlygeek/csapprox'

	" Syntax highlighter for most languages
	Plugin 'scrooloose/syntastic'
  Plugin 'gavocanov/vim-js-indent'
  "Plugin 'othree/yajs.vim'
  "Plugin 'jelera/vim-javascript-syntax'
  Plugin 'pangloss/vim-javascript'
  Plugin 'isRuslan/vim-es6'
  Plugin 'digitaltoad/vim-pug'

  Plugin 'danchoi/ri.vim'

  " Highlight CSS colors
  Plugin 'ap/vim-css-color'

  " Markdown and folding
  Plugin 'godlygeek/tabular'
  Plugin 'plasticboy/vim-markdown'
  Plugin 'suan/vim-instant-markdown'

	" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :PluginUpdate     - updates all plugins

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tab and Window commands
map <leader>e :Explore<CR>
" http://vimcasts.org/episodes/the-edit-command/
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
" prompt for file name to open in current window
map <leader>ew :edit %% 
" prompt for file name, current directory, to be opened in horizontal split window
map <leader>es :split %%
" prompt for file name, current directory, to be opened in horizontal split window
map <leader>ev :vsplit %%
" prompt for file name, current directory, to be opened in new tab
map <leader>et :tabe %%
" http://vimcasts.org/episodes/working-with-tabs/
" move to next tab
map <leader>f gt<CR>
" move to previous tab
map <leader>a gT<CR>
" open new tab with file explorer
map <leader>t :tabe %:h<CR>

set splitbelow
set splitright



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim and Markdown
"
autocmd filetype markdown setlocal spell textwidth=80

" All .md and .markdown files are treated as markdown
" https://github.com/tpope/vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" https://github.com/suan/vim-instant-markdown
" Don't automatically open a browser tab
let g:instant_markdown_autostart = 0
" Use the ,p command to open a browser tab with the markdown in github flavor
autocmd! filetype markdown nnoremap <buffer> <leader>p :InstantMarkdownPreview<CR>

" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let vim_markdown_preview_browser='Google Chrome'
nnoremap <Space> za


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pug syntax
"
autocmd BufNewFile,BufReadPost *.pug set filetype=pug

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" lightline settings
"
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }
set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
" Clear the styles for misspelled words
"
hi clear SpellBad
" underline misspelled words
hi SpellBad cterm=underline 
"Set the color to orange-ish
hi SpellBad ctermfg=166 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation and Spaces
"
set autoindent " auto indent after {
set shiftwidth=2 " number of space characters inserted for indentation
set expandtab " inserts spaces instead of tabs
set tabstop=2 " number of spaces the tab is.
set bs=indent,eol,start		" allow backspacing over everything in insert mode

" Word wrapping visually, but no explicit line break unless Enter explicitly
" pressed
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0

" add spell checking and automatic wrapping at 72 columns to commit messages
autocmd filetype gitcommit setlocal spell textwidth=72


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Movement Keys
" Allow j and k keys to move cursor through soft wrapped lines, AND still
" allow for relative numbers
"
nnoremap <silent> k :<C-U>call Up(v:count)<CR>
vnoremap <silent> k gk

nnoremap <silent> j :<C-U>call Down(v:count)<CR>
vnoremap <silent> j gj

function! Down(vcount)
  if a:vcount == 0
    exe "normal! gj"
  else
    exe "normal! ". a:vcount ."j"
  endif
endfunction

function! Up(vcount)
  if a:vcount == 0
    exe "normal! gk"
  else
    exe "normal! ". a:vcount ."k"
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line Numbers
" Line numbers and relative line numbers, and a mapping to turn them on and off.
"
"set relativenumber "not diggin this at the moment - 5/2/17
set number
noremap <C-N><C-N> :set invnumber<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Last Position
" Return to last edit position when opening files (You want this!)
"
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


nmap <leader>o o<esc>k


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy and Paste Settings
"

" Copy to system clipboard
set clipboard=unnamed

" Automatic Paste mode
function! WrapForTmux(s)
    if !exists('$TMUX')
        return a:s
    endif

    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo
" undo info persists after file closed
" following from: http://amix.dk/vim/vimrc.html
"
if v:version >= 730
  set undodir=~/.vim/undodir
  set undofile
  set undolevels=1000 "maximum number of changes that can be undone
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
  set colorcolumn=79
endif
