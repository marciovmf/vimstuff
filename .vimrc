""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Marciovmf (N)VIM config
" https://github.com/marciovmf/vimstuff
" useful resources:
" 	http://ricostacruz.com/cheatsheets/vimscript
" NOTE: if running neovim, set init.vim as follows:
"	 set runtimepath+=~/vimfiles,~/vimfiles/after
"	 set packpath+=~/.vim
"	 source ~/.vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" -VIMRC MISC------------------------------------------------------------------
  let $VIMHOME = $HOME."/.vim"
  let $SWAPDIR = $VIMHOME."/swap//"
  augroup vimrc
    autocmd!
    autocmd BufEnter .vimrc set foldmethod=indent
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC "Automatically source .vimrc when saving it
    autocmd! BufWritePost "~/.vimrc" source "~/.vimrc" "Automatically source .vimrc when saving it

" -GLOBAL SETTINGS-------------------------------------------------------------
  set title                   "We can change the tile of the window
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
  set listchars=tab:»·,nbsp:+,trail:·,extends:→,precedes:←
  set autoindent
  set smartindent
  set ignorecase
  set smartcase
  set cindent
  set exrc                " Enable per directory .exrc file

" -PLUGINS---------------------------------------------------------------------
  call plug#begin('~/.vim/plugged')
  
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
    command! Clear bufdo Bwipeout!
  
  " -LSP  ------------------------
    Plug 'neovim/nvim-lspconfig'                           " Required
    Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
    Plug 'williamboman/mason-lspconfig.nvim'               " Optional
  
  " -Autocompletion---------------
    Plug 'hrsh7th/nvim-cmp'         " Required
    Plug 'hrsh7th/cmp-nvim-lsp'     " Required
    Plug 'hrsh7th/cmp-buffer'       " Optional
    Plug 'hrsh7th/cmp-path'         " Optional
    Plug 'saadparwaiz1/cmp_luasnip' " Optional
    Plug 'hrsh7th/cmp-nvim-lua'     " Optional
  
  " -Snippets----------------------
    Plug 'L3MON4D3/LuaSnip'             " Required
    Plug 'rafamadriz/friendly-snippets' " Optional
    Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}
  
  " -Telescope---------------------
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'BurntSushi/ripgrep'
    Plug 'sharkdp/fd'
    Plug 'nvim-treesitter/nvim-treesitter'

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
  nnoremap <C-k>g :Telescope grep_string<CR>
  nnoremap <C-K>f :Telescope find_files<CR>
  nnoremap <C-k>b :Telescope buffers<CR>
  nnoremap <C-K>f :Telescope find_files<CR>
  nnoremap <tab> :buffer *

  " FONT size adjust command
  nnoremap <C-Up> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)+1)', 'g')<CR>
  nnoremap <C-Down> :silent! let &guifont = substitute(&guifont, ':h\zs\d\+', '\=eval(submatch(0)-1)', 'g')<CR>

  " Toggle completion on/off with F2 key
  nnoremap <C-F2> :call ToggleCompletion()<CR>
  inoremap <C-F2> <C-o>:call ToggleCompletion()<CR>

  function! ToggleCompletion()
    if &omnifunc ==# ''
      setlocal omnifunc=keywordprg
      echo 'Completion on'
    else
      setlocal omnifunc=
      echo 'Completion off'
    endif
  endfunction

" -Folding---------------------------------------------------------------------
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
  nmap <script> <silent> <F4> :call OpenPrefixWindow()<cr>
  
  " Quickfix
  function! OpenPrefixWindow()
    let currentWindow = winnr()
    if &buftype == "quickfix"
      "bprev
      "wincmd w
      wincmd q
    else
      copen
      wincmd L
     " only
     " copen
     " if (currentWindow == 1)
     "   wincmd L
     " else
     "   wincmd H
     " endif
    endif
  endfunction
  
  au QuickFixCmdPost * :call OpenPrefixWindow()

" -TODO extraction-------------------------------------------------------------
  function! ExtractTodo()
    silent cgete system('todo.bat') | wincmd L
  endfunction

  silent command! Todo call ExtractTodo()

" -Colorscheme and font--------------------------------------------------------
  colo simple
  set guifont=Fira\ Code:h10

" -Project file loading--------------------------------------------------------
  let g:project#name = ""
  let g:vimprj#currentProjectName = ""

  function! UpdateTitleBar()
    let &titlestring = g:vimprj#currentProjectName . " > " .  expand("%:p")  
  endfunction

  function! CheckProjectVim()
    let file_path = getcwd() . "/project.vim"
    if filereadable(file_path)
      execute "source" file_path
      let g:vimprj#currentProjectName = "[" . g:project#name . "]"
    else
      let g:vimprj#currentProjectName = getcwd()
    endif
    call UpdateTitleBar()
  endfunction

  augroup dirchange
    autocmd!
    autocmd! dirChanged * call CheckProjectVim()
    autocmd BufEnter * call UpdateTitleBar()
  augroup END

  call CheckProjectVim()

"--LUA based configurations----------------------------------------------------
  lua <<EOF
  -- LSP-ZERO
  local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
  })

local cmp = require('cmp')

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
  -- Do not capture TAB key!
    ['<Tab>'] = vim.NIL, 
  })
})

  lsp.setup()
EOF

" End of vimrc
