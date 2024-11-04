""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Marciovmf (N)VIM config
" https://github.com/marciovmf/vimstuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" -NEOVIDE---------------------------------------------------------------------

  "let g:neovide_cursor_vfx_mode = ""
  let g:neovide_cursor_animate_command_line = v:true
  let g:neovide_scroll_animation_length = 0.3
  let g:neovide_cursor_vfx_particle_lifetime = 2.0
  let g:neovide_cursor_vfx_particle_density = 40.0
  let g:neovide_cursor_vfx_particle_speed = 20.0
  
  function! ToggleFullscreen()
    let g:neovide_fullscreen = !g:neovide_fullscreen
  endfunction

  noremap   <silent>   <A-CR>   :silent call ToggleFullscreen()<CR>

" -VIMRC MISC------------------------------------------------------------------
  let $VIMHOME = $HOME."/.vim"
  let $SWAPDIR = $VIMHOME."/swap//"
  augroup vimrc
    autocmd!
    autocmd BufEnter */.vimrc set foldmethod=indent
    autocmd BufLeave */.vimrc set foldmethod=syntax
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC "Automatically source .vimrc when saving it
    autocmd! BufWritePost "~/.vimrc" source "~/.vimrc" "Automatically source .vimrc when saving it

" -GLOBAL SETTINGS-------------------------------------------------------------
  filetype plugin on
  set encoding=UTF-8 
  set title                   "We can change the tile of the window
  set syntax
  set noswapfile							"Turn off swap file generation
  set clipboard=unnamed				"Use the OS clipboard for copying/pasting
  set nu                      "Show file numbers
  set foldmethod=syntax
  set foldlevelstart=99
  set expandtab               "Never use hard tabs
  set nojoinspaces            "Avoid double spaces when joining lines
  set shiftwidth=2            "One tab = 2 spaces (auto indent)
  set shiftround              "Only ident to multiple of shiftwidth
  set tabstop=2
  set softtabstop=2           "Tab key inserts 2 spaces
  set textwidth=80            "Maximum characters before wrapping
  set wrap                    "Wrap line after textwidth characters
  set hlsearch                "Highlight search matches
  "'set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←
  set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
  set autoindent
  set smartindent
  set ignorecase
  set smartcase
  set cindent
  set exrc                    "Enable per directory .exrc file
  set laststatus=2						"Always show status bar
  set cursorline              "Enable highlighting the cursor line
  set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %y\ %(\ %m%)\ %{&ft}\ \ %l:\ %L,\ col:%c\ %s

" -PLUGINS---------------------------------------------------------------------
  call plug#begin('~/.vim/plugged')

  " -SMOOTH SCROLLING-------------
  "  Plug 'joeytwiddle/sexy_scroller.vim'

  " -CURSOR WORD------------------
    Plug 'xiyaowong/nvim-cursorword'
    let g:cursorword_disable_at_startup = v:true
    let g:cursorword_min_width = 3
    let g:cursorword_max_width = 50
    hi default CursorWord cterm=underline gui=underline

  " -VIMFILER---------------------
    Plug 'Shougo/unite.vim'
    Plug 'Shougo/vimfiler.vim'
    let g:vimfiler_as_default_explorer = 1

  " -FLOAT TERM-------------------
    Plug 'voldikss/vim-floaterm' " Float term
    nnoremap   <silent>   <c-F7>    :FloatermNew<CR>
    tnoremap   <silent>   <c-F7>    <C-\><C-n>:FloatermNew<CR>
    nnoremap   <silent>   <c-F8>    :FloatermPrev<CR>
    tnoremap   <silent>   <c-F8>    <C-\><C-n>:FloatermPrev<CR>
    nnoremap   <silent>   <c-F9>    :FloatermNext<CR>
    tnoremap   <silent>   <c-F9>    <C-\><C-n>:FloatermNext<CR>
    nnoremap   <silent>   <c-F12>   :FloatermToggle<CR>
    tnoremap   <silent>   <c-F12>   <C-\><C-n>:FloatermToggle<CR>

  " -BBye ------------------------
    Plug 'moll/vim-bbye'	
    map <c-k>k :Bdelete!<cr>
    command! Clear :%bd!

  " -LSP  ------------------------
    Plug 'neovim/nvim-lspconfig'                           " Required
    Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
    Plug 'williamboman/mason-lspconfig.nvim'               " Optional

  " -Autocompletion---------------
    Plug 'hrsh7th/nvim-cmp'         " Required
    Plug 'hrsh7th/cmp-nvim-lsp'     " Required
    Plug 'hrsh7th/cmp-buffer'       " Optional
    Plug 'hrsh7th/cmp-path'         " Optional
    "Plug 'saadparwaiz1/cmp_luasnip' " Optional
    Plug 'hrsh7th/cmp-nvim-lua'     " Optional
  
  " -Snippets----------------------
    Plug 'L3MON4D3/LuaSnip'             " Required
    "Plug 'rafamadriz/friendly-snippets' " Optional
    Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
  
  " -Telescope---------------------
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'sharkdp/fd'
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'

  " -Colorscheme-------------------
  Plug 'ewk/blue_in_green'
  Plug 'habamax/vim-habamax'
  Plug 'Alligator/accent.vim'
  Plug 'jacoborus/tender.vim'
  Plug 'kxzk/skull-vim'


  call plug#end()

" -Keybindings-----------------------------------------------------------------
  nmap <c-s> :update<cr> " Save with C-s
  nnoremap <esc> :nohlsearch<cr>
  " TEXT SELECTION WITH ARROWS
  nmap <S-Up> v<Up>
  nmap <S-Down> v<Down>
  nmap <S-Left> v<Left>
  nmap <S-Right> v<Right>
  vmap <S-Up> <Up>
  vmap <S-Down> <Down>
  vmap <S-Left> <Left>
  vmap <S-Right> <Right>

  " LINE DRAGGING WITH ALT ARROWS
  nnoremap <A-down> :m .+1<CR>==
  nnoremap <A-up> :m .-2<CR>==
  inoremap <A-down> <Esc>:m .+1<CR>==gi
  inoremap <A-up> <Esc>:m .-2<CR>==gi
  vnoremap <A-down> :m '>+1<CR>gv=gv
  vnoremap <A-up> :m '<-2<CR>gv=gv

  " LINE DRAGGING WITH ALT HJKL:
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv

  " Buffer access
  nnoremap <C-k>g :Telescope live_grep<CR>
  nnoremap <C-K>s :Telescope lsp_document_symbols<CR>
  nnoremap <C-k>b :Telescope buffers<CR>
  nnoremap <C-K>f :Telescope find_files<CR>
  nnoremap <tab> :buffer *
  nnoremap <C-K>h :ClangdSwitchSourceHeader<CR>

  " FONT size adjust command
  nnoremap <C-Up> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)+1)', 'g')<CR>
  nnoremap <C-Down> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', 'g')<CR>

  " Toggle completion on/off with F2 key
  nnoremap <F2> :call ToggleCompletion()<CR>

  let g:nvimCmpEnabled = v:true
  function! ToggleCompletion()
    if g:nvimCmpEnabled
      lua require('cmp').setup{ enabled = false }
      let g:nvimCmpEnabled = v:false
    else
      lua require('cmp').setup{ enabled = true }
      let g:nvimCmpEnabled = v:true
    endif
    call UpdateTitleBar()
  endfunction

  " Toggle LSP on/off with F2 key
  nnoremap <F3> :call ToggleLSP()<CR>
  let g:nvimLSPEnabled = v:true
  let g:nvimPrevCMPEnabledValue = g:nvimCmpEnabled
  function! ToggleLSP()
    if g:nvimLSPEnabled
      :LspStop
      let g:nvimLSPEnabled = v:false
      let g:nvimPrevCMPEnabledValue = g:nvimCmpEnabled 
      let g:nvimCmpEnabled = v:false
    else
      :LspStart
      let g:nvimLSPEnabled = v:true
      let g:nvimCmpEnabled = g:nvimPrevCMPEnabledValue
    endif
    call UpdateTitleBar()
  endfunction

" -Folding v1------------------------------------------------------------------
" This function defines a custom display format for folded lines in Vim. 
" It enhances readability by providing context about the content of each fold, 
" including the starting and ending lines within the fold and the number of lines 
" in the folded section.
"
" Function Behavior:
" - If the fold starts with `/*` (typically indicating a comment block), 
"   the function finds the first non-empty line within the fold and uses it 
"   as the display text for the fold.
" - Otherwise, it uses the first line of the fold as the starting text.
" - Displays the number of lines folded at the end in parentheses.
" - Handles line numbers, relative numbers, and signs by adjusting padding as needed 
"   to ensure the fold text aligns well in the editor window.
"
" Process:
" 1. Calculates padding (`lpadding`) to adjust for line numbers, relative numbers, 
"    and signs (like error markers) in the fold column.
" 2. Retrieves the first line of the fold (`l:start`) and replaces tabs with spaces 
"    for a cleaner display.
" 3. Checks if the fold starts with `/*`. If so, it searches through the fold for the 
"    first non-empty line and uses this line as the starting display text.
" 4. Retrieves the last line of the fold (`l:end`) and removes leading whitespace.
" 5. Calculates the available display width (`l:width`) by subtracting padding and 
"    the length of the fold information (number of lines).
" 6. Truncates `l:start` if necessary to fit within the available width and combines 
"    it with `l:end` using a separator (`…`) to indicate omitted content.
" 7. Returns the final fold text, including padding and line count, ensuring the 
"    display fits within the editor's window width.
"
" Example Output:
" - A fold might display as:
"   "This is the first line of the fold … last line of the fold (5)"
"   This includes the first and last lines within the fold, separated by ellipses, 
"   with the total number of lines in the fold shown at the end.
"
" Note:
" - Ensure that 'set foldtext=FoldText()' is in your Vim configuration to enable 
"   this custom fold display.
" - This function is designed for use with syntax-based folding ('set foldmethod=syntax').
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

  " Determine fold display text based on whether fold starts with "/*"
  let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  if l:start =~ '^\s*/\*'
    " Loop to find the first non-empty line within the fold
    let l:first_non_empty = ''
    for l:i in range(v:foldstart + 1, v:foldend)
      let l:line = substitute(getline(l:i), '\t', repeat(' ', &tabstop), 'g')
      if l:line !~ '^\s*$'  " Check if the line is not empty
        let l:first_non_empty = l:line
        break
      endif
    endfor
    if l:first_non_empty != ''
      let l:start = l:first_non_empty
    endif
  endif

  " Process the end line and other settings as before
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

" -Building--------------------------------------------------------------------
  compiler msvc
  
  function! Build()
    :silent make clean
    :silent make
    :cw
    :redraw!
  endfunction
  
  function! Clean()
    :silent make clean
  endfunction
  
  function! SetCMakeMakeprg()
    set makeprg=cmake
  endfunction
  
  function! SetNMakeMakeprg()
    set makeprg=nmake
  endfunction
  
  function! SetMakeMakeprg()
    set makeprg=make
  endfunction
  
  function! Clean()
    :silent make clean
  endfunction
  
  function! Build()
    ":silent cmake --build .\build --target clean
    :silent make 
    :silent call ShowBuildOutput()
  endfunction
  
  function! Rebuild()
    :silent call Clean()
    :silent call Build()
  endfunction
  
  function! ShowBuildOutput()
    :cw
    :redraw!
  endfunction
  
  call SetMakeMakeprg() " Use Make as default make program
  
  set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
  set errorformat+=,%f:\ error\ %s:%m
  set errorformat+=,%f:\ fatal\ error\ %s:%m
  autocmd VimResized * :wincmd =
  
  " Rebuild
  nmap <F9> :silent call Build()<cr>
  nmap <F10> :silent call Rebuild()<cr>
  nmap <script> <silent> <F4> :call ToggleQuickfix()<cr>
  
  " Quickfix
  function! ToggleQuickfix()
    let found = 0
    let num_splits = winnr('$')
    for i in range(1, num_splits)
      let bufnr = winbufnr(i)
      if getbufvar(bufnr, '&buftype') ==# 'quickfix'
        execute i . 'wincmd w'
        Bdelete!
        let found = 1
      endif
    endfor

    if (found == 0)
      call OpenPrefixWindow()
    endif

  endfunction

  function! OpenPrefixWindow()
    "This function opens the Quickfix buffe on the rightmost vertical split.
    "If there are less than 3 splis, it will create another one.
    "If there are 3 or more, the quickfix window will replace the rightmost existing split
    let num_splits = winnr('$')
    if num_splits >= 3
      execute num_splits . "wincmd w"
      wincmd q
    endif
    vertical copen
    wincmd L
    wincmd =
  endfunction
  au QuickFixCmdPost * :call OpenPrefixWindow()

" -TODO extraction-------------------------------------------------------------
  function! ExtractTodo()
    silent cgete system('todo.bat') | wincmd L
  endfunction

  silent command! Todo call ExtractTodo()

" -Colorscheme and font--------------------------------------------------------
  " Hide split line
  function! OnThemeReload()
    highlight VertSplit guibg=bg guifg=bg
    set fillchars+=vert:\ 
  endfunction

  colo simple
  "set guifont=FiraCode\ Nerd\ Font:h9
  set guifont=Fira\ Code:h9
  autocmd ColorScheme * call OnThemeReload()


" -Project file loading--------------------------------------------------------
  let g:project#name = ""
  let g:vimprj#currentProjectName = ""

  function! UpdateTitleBar()
    let l:completionStatus = ""
    if g:nvimCmpEnabled == v:true
      let l:completionStatus = "\t[ 🧩 Autocompletion enabled ]"
    endif

    if g:nvimLSPEnabled == v:true
      let l:completionStatus .= "\t[ 🧩 LSP enabled ]"
    endif

    let iconList = { 'qf':'🔧', 'help':'🎓', 'netrw':'📁', 'default':'🗒️', '':'❓' }

    let icon = iconList["default"]
    if has_key(iconList, &filetype)
      let icon = iconList[&filetype]
    endif

    let l:fileName = expand("%t")
    if len(l:fileName) == 0
      let l:fileName = &filetype
    endif

    let l:fileName = icon . l:fileName

    let &titlestring = g:vimprj#currentProjectName . " :: " . l:fileName . l:completionStatus
  endfunction

  function! CheckProjectVim()
    let file_path = getcwd() . "/project.vim"
    if filereadable(file_path)
      execute "source" file_path
      let g:vimprj#currentProjectName = g:project#name
    else
      let g:vimprj#currentProjectName = nr2char(0x1F4C1) . getcwd()
    endif
    call UpdateTitleBar()
  endfunction

  function! LoadProjectCommand(path)
    Clear
    execute "cd " . a:path
    let sessionFile = a:path . "/Session.vim"
    execute "source " . sessionFile
    call CheckProjectVim()
  endfunction

  augroup dirchange
    autocmd!
    autocmd! dirChanged * call CheckProjectVim()
    autocmd BufEnter * call UpdateTitleBar()
  augroup END

  command! -nargs=1 Project :silent! call LoadProjectCommand(<q-args>)

  call CheckProjectVim()

"--Skeleton files -------------------------------------------------------------
function! UpdateSkeletonBuffer(extension)
  "Header file
  let bufname = substitute(fnamemodify(bufname('%'), ':t'), '[^[:alnum:]]', '_', 'g')
  if a:extension == "h"
    silent! execute '%s/%header_name%/' . toupper(bufname) . '/g'
    let l:namespace = g:project#defaultNamespace
    if len(l:namespace) == 0
      let l:namespace = "my_name_space"
    endif
    silent! execute '%s/%namespace%/' . l:namespace . '/g'

    if search('%cursor%', 'c') > 0
      normal diW
    endif
    silent! execute '%s/%%/' . g:project#defaultNamespace . '/g'
  endif

  " set the buffer as modified. We don't want to get confused thinking it's an existing file
  call setbufvar(bufnr(), '&modified', 1)

endfunction

augroup skeletons
  au!
  autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e") | call UpdateSkeletonBuffer(expand("<afile>:e"))
  autocmd BufNewFile CMakeLists.txt execute '0r ~/.vim/templates/CMakeLists.txt' | call UpdateSkeletonBuffer("<afile>:e")
  autocmd BufNewFile project.vim execute '0r ~/.vim/templates/project.vim' | call UpdateSkeletonBuffer("<afile>:e")
augroup END


"--File type autocmd-----------------------------------------------------------

autocmd BufEnter   Pass :Bdelete!

autocmd BufEnter *.c setfiletype c
autocmd BufEnter *.cpp setfiletype cpp
autocmd BufEnter *.h setfiletype cpp
autocmd BufEnter *.md setfiletype md
autocmd BufEnter *.xml setfiletype xml
autocmd BufEnter *.json setfiletype json

autocmd BufWritePost *.c setfiletype c
autocmd BufWritePost *.cpp setfiletype cpp
autocmd BufWritePost *.h setfiletype cpp
autocmd BufWritePost *.md setfiletype md
autocmd BufWritePost *.xml setfiletype xml
autocmd BufWritePost *.json setfiletype json

let g:cmp_widget_border = 'rounded'
"--LUA based configurations----------------------------------------------------
  lua <<EOF
  -- LSP-ZERO
  local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
  virtual_text = true
  })

local cmp = require('cmp')

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
  -- Do not capture TAB key!
    ['<Tab>'] = vim.NIL, 
  })
})

  lsp.setup()

vim.diagnostic.config({
  -- Use keybinding 'gl' to display diagnostics if this is disabled
  virtual_text = false, 
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

EOF
" End of vimrc
