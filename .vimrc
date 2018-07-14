""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Marciovmf (N)VIM config                                                    "
" https://github.com/marciovmf/vimstuff
" useful resources:
" 	http://ricostacruz.com/cheatsheets/vimscript
" NOTE: if running neovim, set init.vim as follows:
"	 set runtimepath+=~/vimfiles,~/vimfiles/after
"	 set packpath+=~/.vim
"	 source ~/.vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"#1 VIMRC
let $VIMHOME = $HOME."/.vim"
let $SWAPDIR = $VIMHOME."/swap//"

augroup vimrc
  autocmd!
  autocmd BufEnter .vimrc set foldmethod=marker foldcolumn=3 foldmarker=\"\#,\"\#
  autocmd BufEnter .vimrc normal! zM
augroup END

"#1 PLUGINS
call plug#begin('~/.vim/plugged')
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"Plug 'kien/ctrlp.vim'
Plug 'Shougo/unite.vim'
Plug 'yuttie/comfortable-motion.vim' 	"for better scrolling
Plug 'Shougo/vimfiler.vim'						"Better netrw
Plug 'vim-scripts/OmniCppComplete'
Plug 'majutsushi/tagbar'
Plug 'ryanoasis/vim-devicons'					"fancy icons.
Plug 'moll/vim-bbye' 									"keeps window open after killing its last buffer
" Snipmate and dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
"Plug 'xolox/vim-easytags'
call plug#end()

"#2 BBYE
" Kill buffer 
map <c-k>k :Bdelete!<cr>

"#2 TAGBAR
"open tagbar 
noremap ,t :TagbarOpenAutoClose<CR>
" search for tag
nnoremap ,, :tag *

"#2 VIMFILER
"let vimfiler replace netrw
let g:vimfiler_as_default_explorer = 1
nmap ,e :VimFilerB <CR>i
" open file explorer 
noremap ,f :VimFilerSimple<CR>


"#2 OMNI-CPP-COMPLETE
" reference http://vim.wikia.com/wiki/C%2B%2B_code_completion
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"#2 AIRLINE
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" unicode symbols
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set directory=$SWAPDIR

"#1 MISC SETTINGS:
syntax on
filetype plugin on
filetype indent on
let mapleader = "\<space>"
set fileencoding=utf8
set encoding=utf8
set termencoding=utf8
set nocompatible						"Not compatible with VI
set incsearch								"Enable incremental search
set number									"Show line numbers
set cursorline							"Highlight current cursor line	
set wildmenu								"Display all matching files when we tab complete
set ignorecase							"By default ignore search case
set smartcase								"Do not ignore search case if it contains any Upper case
set mouse=a									"enable mouse interaction (do not abuse it!)
set nowrap									"Do NOT wrap text around if it is longer than screen width
set ruler										"Show line and column number under cursor position
set equalalways							"All windows should have the same size
set switchbuf=useopen				"use existing window for som type of buffers
set laststatus=2						"Always show status bar
set backspace=2							"backspace goes to end of previous line if current is empty
set shortmess=at						"Short messages
set showmatch								"highlight matching brackets
set belloff=all							"set visualbell
set tw=120									"soft colun nu
set showcmd									"Show input of an incomplete command
set completeopt=longest,menuone	"Insert mmac_classicode completion tweaks
set hidden 									"Allow vim to hide buffers even though they contain modifications
set path+=** 								"Search down subfolders
set wildmode=list:list,full	"Provides tab-completion for all file-related tasks
set hidden									"Hide abandoned buffers
set clipboard=unnamed				"Use the OS clipboard for copying/pasting
set wildcharm=<tab>					"so we can use it to activate wildmenu from commands
set sidescrolloff=5					"begin scrolling n charecters befor right margin
set nowritebackup						"Write the buffers straight to the original file
set lazyredraw							"For better performance when replaying macros
set showbreak=↳							"Show this character when wrapping a line
set noswapfile							"Turn off swap file generation
set nobackup								"Turn off backup files
set autoread								"Autoreaload changed files
" FORMATTING
set expandtab								"Never use hard tabs
set nojoinspaces						"Avoid double spaces when joining lines
set tabstop=2
set shiftwidth=2						"One tab = 2 spaces (auto indent)
set shiftround							"Only ident to multiple of shiftwidth
set softtabstop=2           "Tab key inserts 2 spaces
set textwidth=80            "Maximum characters before wrapping
set wrap                    "Wrap line after textwidth characters
set hlsearch                "Highlight search matches
set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←
set autoindent
set smartindent
set cindent
" NETRW 
let g:netrw_banner=0				"disable banner
let g:netrw_browse_split=0	"open in prior window
let g:netrw_altv=1					"open splits to the right
let g:netrw_liststyle=3			"tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S+'
" DISABLE GUI STUFF im GVIM:
if has ('gui_running')
  set guioptions-=m  "remove menu bar`
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  "set lines=80 columns=108 linespace=0
  set linespace=0
  set guifont=Consolas:h10:b:cANSI:qDRAFT
endif

set title
augroup dirchange
  autocmd!
  "autocmd DirChanged * let &titlestring=v:event['cwd']
  autocmd BufEnter * let &titlestring = expand("%:p")

augroup END
" Statusline with current tag name
set statusline=%<%f\ %h%m%r\ \ \ \ %{tagbar#currenttag('%s','-','f')}\%=\ \ %l,%c%V\ %P

"#1 FOLDING: 
" https://coderwall.com/p/usd_cw/a-pretty-vim-foldtext-function
set foldmethod=syntax
set foldlevelstart=99
"set fillchars=fold:\  

set foldtext=FoldText()
function! FoldText()
  let l:lpadding = &fdc
  redir => l:signs
  execute 'silent sign place buffer='.bufnr('%')
  redir End
  let l:lpadding += l:signs =~ 'id=' ? 2 : 0

  if exists("+relativenumber")
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
    elseif (&relativenumber)
      let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
    endif
  else
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
    endif
  endif
  " expand tabs
  let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

  let l:info = ' (' . (v:foldend - v:foldstart) . ')'
  let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
  let l:width = winwidth(0) - l:lpadding - l:infolen

  let l:separator = ' … '
  let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
  let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
  let l:text = l:start . ' … ' . l:end

  return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
endfunction

"#1 SESSION SAVING:
if has('nvim')
  set shada=%,'50 
  set shada+=\"100,:100 
  set shada+=n~/.nviminfo
else
  set vi=%,'50 
  set vi+=\"100,:100 
  set vi+=n~/.viminfo
endif

"#1 NEOVIM SETTINGS AND MAPPINGS
if has('nvim')
  set inccommand=nosplit				" live preview of incremental commands
  tnoremap <Esc> <C-\><C-n> 		" ESC exits terminal mode
  tnoremap <M-[> <Esc>      		" ALT+ESC sends esc to terminal applicaton
endif

"#1 CUSTOM SHORTCUTS:
nnoremap <esc> :nohlsearch<cr>
" find files under path
noremap ,o :find .\*<tab>
" kk exits insert mode
inoremap kk <esc>
" jj exits insert mode
inoremap jj <esc>
" ERNTER adds new line on normal mode! 
" (Except on quickfix window)
:autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
:autocmd BufReadPost help nnoremap <buffer> <CR> <CR>
nnoremap <CR> o<esc>
" CTRL+A selects all lines
inoremap <C-a> <esc>ggvG$ 
" CTRL+A selects all lines
nnoremap <C-a> ggvG$
" commenting / uncomenting code
function! UncommentLine()
  :s/^.*\/\//
  :noh
  :norm ==
endfunction

vnoremap <leader>c :norm I//<cr>
vnoremap <leader>u :call UncommentLine()<cr>
nnoremap <leader>c :norm I//<cr>
nnoremap <leader>u :call UncommentLine()<cr>

" Auto close surounding pairs
inoremap ( ()<ESC>i
inoremap { {}<ESC>i
inoremap [ []<ESC>i

" Search/replace selection
vnoremap <leader>r ""y:%s/<C-R>=escape(@", '/\')<CR>//gc<Left><Left>

"#2 LINE DRAGGING WITH ALT ARROWS
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

"#2 LINE DRAGGING WITH ALT HJKL:
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"#2 SAVE FILE WITH CTRL S:
" this may require you to put 'stty -ixon' on my .bash_profile 
nmap <c-s> :update<cr>
imap <c-s> <esc>:update<cr>:echon "updated"<cr>i

"#2 CYLE BUFFERS AND WINDOWS:
"cycle through buffers
nnoremap <tab> :buffer *<tab>
nnoremap <C-Tab> :wincmd w<CR><esc>					"Cycle windows

"#2 TEXT SELECTION WITH ARROWS:
" shift+arrows
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>

"#2 INSERT MODE COPY AND PASTE:
" Use standard copy/paste/cut shortcuts
imap <C-v> <Esc>pa
imap <C-z> <Esc>ua

"#1 TAGGING:

"if has('nvim')
"	command! MakeTags :call jobstart('ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .')
"else
command! MakeTags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
"endif

set tags=./tags;
"set tags+=tags;
if has('win32')
  set tags+=$VIMHOME\tags\win32
  set tags+=$VIMHOME\tags\sdl
endif

autocmd BufReadPost *.cpp,*.c,*.h,*.hpp :silent MakeTags
autocmd BufWritePost *.cpp,*.c,*.h,*.hpp :silent MakeTags

"#1 COMPILING:
function! Build()
  :silent make clean && make
  :cw
  :redraw!
endfunction

function! Run()
  :silent !make run
endfunction

function! Debug()
  :silent !make debug
endfunction

augroup qfixCloseOnEscape
  autocmd!
  autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
  autocmd FileType qf nnoremap <buffer><silent> <F4> :cclose<bar>lclose<CR> 
augroup END

:compiler msvc
set makeprg=make
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
set errorformat+=,%f:\ error\ %s:%m
set errorformat+=,%f:\ fatal\ error\ %s:%m
autocmd VimResized * :wincmd =

"Force error window to appear at bottom
autocmd FileType qf wincmd J | :set wrap

function! ToggleQuickFix()
  if exists("g:qwindow")
    cclose
    unlet g:qwindow
  else
    try
      copen 10
      let g:qwindow = 1
    catch 
      echo "No Errors found!"
    endtry
  endif
endfunction

map <F5> :call Run()<cr>
map <F9> :call Build()<cr>
map <F11> :call Debug()<cr>
nmap <script> <silent> <F4> :copen<CR>

command! Clear bufdo Bwipeout!
command! Todo new | wincmd J | set ft:cpp | r!todo.bat 

"#1 COLORSCHEME:
"try loading a color scheme if it exists
"let expected_theme="coffee"
"if filereadable($VIMHOME."/colors/".$expected_theme)
"	colorscheme $expeted_theme
"endif

" Hide division line no matter the colorscheme 
autocmd ColorScheme * call OnThemeReload()

function! OnThemeReload()
  highlight VertSplit guibg=bg guifg=bg
  set fillchars+=vert:\ 
endfunction
colorscheme home 
highlight VertSplit guibg=bg guifg=bg
" end of .vimrc

