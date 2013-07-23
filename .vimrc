" no vi-compatible
set nocompatible

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" required for vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles from GitHub repos:

" Python and PHP Debugger
Bundle 'fisadev/vim-debug.vim'

" Better file browser
Bundle 'scrooloose/nerdtree'

" Class/module browser
Bundle 'majutsushi/tagbar'

" Git integration
Bundle 'motemen/git-vim'

" Tab list panel
Bundle 'kien/tabman.vim'

" Powerline
Bundle 'Lokaltog/vim-powerline'

" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'

" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'

" Indent text object
Bundle 'michaeljsmith/vim-indent-object'

" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'

" Install snipmate dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"

" Install snipmate
Bundle 'garbas/vim-snipmate'

" Vim-LESS
Bundle 'groenewege/vim-less'

" Bundles from vim-scripts repos

" Autocompletion
Bundle 'AutoComplPop'

" Python code checker
Bundle 'pyflakes.vim'

" Search results counter
Bundle 'IndexedSearch'

" XML/HTML tags navigation
Bundle 'matchit.zip'

" Gvim colorscheme
Bundle 'Wombat'


" JSHint
"Bundle 'walm/jshint.vim'

" VimErl
Bundle 'jimenezrick/vimerl'

" Lisp Flavoured Erlang
Bundle 'lfe/vim-lfe'


" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" allow plugins by file type
filetype plugin on
"filetype indent on

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tablength exceptions
"autocmd FileType html setlocal shiftwidth=2 tabstop=2
"autocmd FileType htmldjango setlocal shiftwidth=2 tabstop=2
autocmd FileType make setlocal noexpandtab

" always show status bar
set ls=2

" incremental search
set incsearch

" no highlighted search results
set nohlsearch

" line numbers
" set nu

" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>


" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
map <F2> :TaskList<CR>

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black
" use global scope search
let OmniCpp_GlobalScopeSearch = 1
" 0 = namespaces disabled
" 1 = search namespaces in the current buffer
" 2 = search namespaces in the current buffer and in included files
let OmniCpp_NamespaceSearch = 2
" 0 = auto
" 1 = always show all members
let OmniCpp_DisplayMode = 1
" 0 = don't show scope in abbreviation
" 1 = show scope in abbreviation and remove the last column
let OmniCpp_ShowScopeInAbbr = 0
" This option allows to display the prototype of a function in the abbreviation part of the popup menu.
" 0 = don't display prototype in abbreviation
" 1 = display prototype in abbreviation
let OmniCpp_ShowPrototypeInAbbr = 1
" This option allows to show/hide the access information ('+', '#', '-') in the popup menu.
" 0 = hide access
" 1 = show access
let OmniCpp_ShowAccess = 1
" This option can be use if you don't want to parse using namespace declarations in included files and want to add
" namespaces that are always used in your project.
let OmniCpp_DefaultNamespaces = ["std"]
" Complete Behaviour
let OmniCpp_MayCompleteDot = 0
let OmniCpp_MayCompleteArrow = 0
let OmniCpp_MayCompleteScope = 0
" When 'completeopt' does not contain "longest", Vim automatically select the first entry of the popup menu. You can
" change this behaviour with the OmniCpp_SelectFirstItem option.
let OmniCpp_SelectFirstItem = 0

" debugger keyboard shortcuts
map <F5> :Dbg over<CR>
map <F6> :Dbg into<CR>
map <F7> :Dbg out<CR>
map <F8> :Dbg here<CR>
map <F9> :Dbg break<CR>
map <F10> :Dbg watch<CR>
map <F11> :Dbg down<CR>
map <F12> :Dbg up<CR>


" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" python-mode settings
" don't show lint result every time we save a file
let g:pymode_lint_write = 0
" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
" rules to ignore (example: "E501,W293")
let g:pymode_lint_ignore = ""
" don't add extra column for error icons (on console vim creates a 2-char-wide
" extra column)
let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 0
" don't load rope by default. Change to 1 to use rope
let g:pymode_rope = 0

" rope (from python-mode) settings
nmap ,d :RopeGotoDefinition<CR>
nmap ,o :RopeFindOccurrences<CR>

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|screen-256'
	let &t_Co = 256
    " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

" colors for gvim
if has('gui_running')
    colorscheme wombat
endif

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest


" to use fancy symbols for powerline, uncomment the following line and use a
" patched font (more info on the README.rst)
" let g:Powerline_symbols = 'fancy'

" Disable Replace mode
imap <Ins> <esc>i

" Make Vim jump to the last position when reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal g'\"" | endif
endif 

" Enable mouse
set mouse=a
set mousemodel=popup

" Copy indent from current line when starting a new line 
set autoindent

" Puts information in the term title bar
set title

" Improves smoothness of redrawing
set ttyfast

set background=dark

" Wrapping of lines at word boundries
set linebreak
" When you set the option above, vim might give you one annoyance. 
" Trying to move the cursor up or down, you will notice, 
" that it moves not by display line, but by logical lines, 
" which is quite inconvenient. 
" Here is the function To cure this
function SetWrap()
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction


au! BufRead,BufNewFile *.txt call SetWrap()

" preserve selection after block shifting                 
vnoremap < <gv
vnoremap > >gv

" Put the new window below the current
set splitbelow

" Save file with Control+s
nmap <C-s> :w<cr>
vmap <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>

" Control+q to quit
silent !stty -ixon > /dev/null 2>/dev/null
nmap <C-q> :q<cr>
vmap <C-q> <esc>:q<cr>
imap <C-q> <esc>:q<cr>

" Navigate windows with Control+arrows
map <C-Right> <c-w>l
map <C-Left> <c-w>h
map <C-Up> <c-w>k
map <C-Down> <c-w>j
imap <C-Right> <ESC><c-w>l
imap <C-Left> <ESC><c-w>h
imap <C-Up> <ESC><c-w>k
imap <C-Down> <ESC><c-w>j

nnoremap gf <c-w>gf

" Disable line numbers in Python source files
au! BufRead,BufNewFile *.py set nonu

" Plugin settings

" Disable line numbering int the TabMan window 
let g:tabman_number = 0

autocmd FileType python set omnifunc=pythoncomplete#Complete

" SnipMate snippets for Django
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate
au BufRead,BufNewFile *.dtl set filetype=htmldjango

" Case-sensitive if search contains an uppercase character
set smartcase

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Fixing some fisadev-colorscheme colors 
hi VertSplit guifg=#444444 guibg=#303030 guisp=#303030 gui=NONE ctermfg=white ctermbg=NONE cterm=NONE
hi NonText guifg=#808080 guibg=#202020 guisp=#202020 gui=NONE ctermfg=8 ctermbg=NONE cterm=NONE
hi SignColumn guifg=#424242 guibg=#202020 guisp=#202020 gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
