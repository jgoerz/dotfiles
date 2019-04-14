set nocompatible

let mapleader=","

" Try loading package manager
packadd minpac

if !exists('*minpac#init')
  " minpac is not available.
  " Settings for plugin-less environment.
else
  " minpac is available.
  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  "This is a builtin for Vim8
  packadd! matchit
  " For Vim < 8: runtime macros/matchit.vim

  " https://github.com/sheerun/vim-polyglot
  call minpac#add('sheerun/vim-polyglot')

  " This one just kills my old laptop.
  " https://github.com/ludovicchabant/vim-gutentags
  " call minpac#add('ludovicchabant/vim-gutentags')
  " let g:gutentags_cache_dir = '~/.tags_cache' " https://github.com/ludovicchabant/vim-gutentags/blob/master/doc/gutentags.txt#L447

  " https://github.com/tomtom/tcomment_vim
  call minpac#add('tomtom/tcomment_vim')
    map <leader>x :TComment<CR>
    " map <leader>b <c-_>b  Also toggles comment

  " https://github.com/rking/ag.vim
  call minpac#add('rking/ag.vim')

  " https://github.com/vim-scripts/mru.vim
  call minpac#add('vim-scripts/mru.vim')
    " Make MRU easier to work with
    map <leader>e :MRU<CR>

  " https://github.com/scrooloose/nerdtree
  call minpac#add('scrooloose/nerdtree')
    map <leader>n :NERDTree<CR>
    map <leader>q :let NERDTreeQuitOnOpen=!NERDTreeQuitOnOpen
    let g:NERDTreeIgnore=['\~$', '\.o$', '\.lo$', '\.swp', '\.swo']

  call minpac#add('Xuyuanp/nerdtree-git-plugin')
  let g:NERDTreeShowIgnoredStatus=1
  " let g:NERDTreeIndicatorMapCustom = {
  "   \ "Modified"  : "✹",
  "   \ "Staged"    : "✚",
  "   \ "Untracked" : "✭",
  "   \ "Renamed"   : "➜",
  "   \ "Unmerged"  : "═",
  "   \ "Deleted"   : "✖",
  "   \ "Dirty"     : "✗",
  "   \ "Clean"     : "✔︎",
  "   \ "Ignored"   : '☒'',
  "   \ "Unknown"   : "?"
  "   \ }

  " https://github.com/tpope/vim-projectionist
  call minpac#add('tpope/vim-projectionist')

  " This one is way out of date.
  " https://github.com/c-brenn/phoenix.vim
  " call minpac#add('c-brenn/phoenix.vim')

  " https://github.com/tpope/vim-fugitive
  call minpac#add('tpope/vim-fugitive')
    map <leader>dv :Gvdiff<CR>
    map <leader>gs :Gstatus<CR>
    map <leader>gb :Gblame<CR>

  " https://github.com/tpope/vim-fugitive
  call minpac#add('tpope/vim-markdown')
    " vim-markdown
    " If you want to enable fenced code block syntax highlighting in your markdown
    " documents you can enable it in your .vimrc like so:
    let g:markdown_fenced_languages=['html', 'python', 'bash=sh', 'ruby', 'yml=yaml', 'json']
    " Syntax highlight is synchronized in 50 lines. It may cause collapsed
    " highlighting at large fenced code block. In the case, please set larger
    " value in your vimrc.  Note that setting too large value may cause bad
    " performance on highlighting.
    let g:markdown_minlines=100

  " https://github.com/tpope/vim-fugitive
  call minpac#add('tpope/vim-unimpaired')

  " https://github.com/tpope/vim-abolish
  call minpac#add('tpope/vim-abolish')
  " Plugin settings here.

  " https://github.com/mhinz/vim-mix-format
  call minpac#add('mhinz/vim-mix-format')

  " https://github.com/airblade/vim-gitgutter
  call minpac#add('airblade/vim-gitgutter')

  " https://github.com/faith/vim-go
  call minpac#add('fatih/vim-go')

  " https://github.com/elixir-lang/vim-elixir
  call minpac#add('elixir-lang/vim-elixir')

  " https://github.com/slashmili/alchemist.vim
  call minpac#add('slashmili/alchemist.vim')
    let g:alchemist_tag_disable = 1

  " Ruby sources for deoplete
  call minpac#add('takkii/Bignyanco')

  " Deoplete install instructions:
  "
  " https://github.com/Shougo/deoplete.nvim
  " sudo apt-get install python3 pip3
  " pip3 install pynvim
  " test with: :echo neovim_rpc#serveraddr() should get: something like 127.0.0.1:51359 or /tmp/vmrUX9X/2
  " Install and test nvim-yarp and vim-hug-neovim-rpc below
  call minpac#add('Shougo/deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
    " let g:deoplete#disable_auto_complete = 1  If we start with this, #toggle() doesn't work.
    " let g:deoplete#auto_complete_delay = 10
    let g:deoplete#auto_refresh_delay = 10
    noremap  <leader>dt :<C-u>call deoplete#toggle()<cr>
    inoremap <leader>dt <c-o>:call deoplete#toggle()<cr>

    " Use tab for manual autocomplete navigation and backspace still works on current word.
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
    endfunction
    inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()

    " Needed for Vim8 and deoplete
    call minpac#add('roxma/nvim-yarp')
    call minpac#add('roxma/vim-hug-neovim-rpc')

    " set pyxversion=3
    " only needed if echo exepath('python3') is empty
    " let g:python3_host_prog = /usr/bin/python3

	" Echo text from autocomplete to command line, currently only works well
  " with alchemist/elixirsense
  call minpac#add('Shougo/echodoc.vim')
    let g:echodoc#enable_at_startup=1
    " set completeopt-=preview 
    "set completeopt+=noinsert 

  " Make testing quick and simple with tmux.
  call minpac#add('jgdavey/vim-turbux')
    let g:turbux_command_prefix = 'bundle exec'  " default prefix
    function! s:be_prefix()
      let g:turbux_command_prefix = 'bundle exec'
    endfunction
    noremap  <leader>bp :<C-u>call <SID>be_prefix()<cr>

    function! s:default_prefix()
      let g:turbux_command_prefix = ''
    endfunction
    noremap  <leader>dp :<C-u>call <SID>default_prefix()<cr>

  call minpac#add('jgdavey/tslime.vim')
    let g:tslime_always_current_session = 1
    let g:tslime_always_current_window = 1
endif


"
" Common settings here
"
set nocompatible
set modeline
set ai
set expandtab
set tabstop=2
set shiftwidth=2
set expandtab
" set smarttab
set background=dark
set showmatch
set hlsearch
set visualbell
set cmdheight=2
" set noshowmode
set laststatus=2


" Disable the gnome "help" key, it's too close to the escape and pops up an
" app.
nmap <F1> <nop>
imap <F1> <nop>

filetype plugin indent on
source $VIMRUNTIME/colors/koehler.vim

" Highlighting for man pages
source $VIMRUNTIME/ftplugin/man.vim

" Modify the colors of the autocomplete popup menu
" These need to be sourced after koehler.vim
highlight Pmenu ctermfg=black ctermbg=cyan  " normal item
highlight PmenuSel ctermfg=cyan  ctermbg=black " selected item

"# set list
""to create '·' do :set digraphs, then type . <backspace> M
""to create '≫' do :set digraphs, then type > <backspace> >
""set listchars=trail:·,nbsp:·,tab:≫·
""set listchars=trail:·,nbsp:·
"set listchars=trail:·,nbsp:·,tab:≫·
"" This one below seems to mess up diffs
"" set t_Co=256
"" set t_Co=16
"

"" Override the default tab color (has to come after syntax on)
"hi SpecialKey cterm=bold ctermfg=darkblue
"
