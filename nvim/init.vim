call plug#begin('~/.config/nvim/plug')
Plug 'SuperSimen/vim-twig'
Plug 'SuperTab--Van-Dewoestine'
Plug 'Tabular'
Plug 'abolish.vim'
Plug 'ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'go.vim'
Plug 'gruvbox'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'quickrun.vim'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
call plug#end()

filetype plugin indent on

syntax on

set autoread
set mouse=a
set clipboard=unnamed
set cmdheight=1
set laststatus=2
set lazyredraw
set list
set listchars=tab:·\ ,nbsp:·,trail:•
set ruler
set tabstop=4 shiftwidth=4
set expandtab
set number
set relativenumber
set linespace=2
set smartindent
set backspace=start,indent,eol
set nowrap
set title
set modeline
set showbreak=>\ 
set noswapfile
set nobackup
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set hidden
set wildmenu
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark

" colors
colorscheme base16-eighties

" reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" make j and k always move to next visual line (useful for wrapped lines).
nnoremap j gj
nnoremap k gk

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" Trigger autoread when changing buffers or coming back to vim.
au FocusGained,BufEnter * :silent! !

" When switching panes in tmux, an escape sequence is printed. Redrawing gets
" rid of it. See https://gist.github.com/mislav/5189704#comment-951447
au FocusLost * :redraw!

" mappings and commands
let mapleader=" "
nnoremap <silent> <Leader>, :e ~/.vimrc<CR>
nnoremap <Leader>j :Files<CR>
nnoremap <Leader>l :Buffers<CR>
nnoremap <Leader>k :BTags<CR>
nnoremap <silent> <Leader>[ :nohlsearch<CR>
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>r :QuickRun<CR>
vnoremap <silent> <Leader>a :Tabularize /=>\?<CR>

command! W call Upload()

" emmet
let g:user_emmet_leader_key='<C-e>'
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

" ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" gitgutter
let g:gitgutter_realtime = 1

" fix sparkup/supertab conflict
let g:sparkupNextMapping = '<c-x>'

" upload
fun! Upload()
	silent write
	let job = jobstart([expand('$HOME') . '/.config/scripts/upload', expand('%:p')])
endfun

" autocommands

" detect go
autocmd BufNewFile,BufReadPost *.go set filetype=go
