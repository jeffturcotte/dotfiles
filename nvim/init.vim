call plug#begin('~/.config/nvim/plug')
Plug 'SuperTab--Van-Dewoestine'
Plug 'SuperSimen/vim-twig'
Plug 'Syntastic'
Plug 'Tabular'
Plug 'abolish.vim'
Plug 'ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/base16-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'go.vim'
Plug 'gruvbox'
"Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'posva/vim-vue'
Plug 'quickrun.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'rizzatti/dash.vim'
Plug 'pangloss/vim-javascript'
"Plug 'reedes/vim-colors-pencil'
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
set number
set relativenumber
set linespace=2
set noexpandtab
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
"set guioptions+=lrb
"set guioptions-=lrb

"let base16colorspace=256
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

" syntastic
set statusline=[%n]\ %t
set statusline+=%=%l:%c
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_auto_jump=1
"let g:syntastic_enable_signs=1
"let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" gitgutter
let g:gitgutter_realtime = 1

" fix sparkup/supertab conflict
let g:sparkupNextMapping = '<c-x>'

fun! TransmitUpload()
	silent write
	let job = jobstart([expand('$HOME') . '/.config/scripts/transmit', expand('%:p')])
endfun

fun! Upload()
	silent write
	let job = jobstart([expand('$HOME') . '/.config/scripts/upload', expand('%:p')])
endfun


" Autocommands

" sparkup filetypes
augroup sparkup_types
   autocmd!
   autocmd FileType mustache,php,html runtime! ftplugin/html/sparkup.vim
augroup END

" reload vimrc
autocmd! BufWritePost .vimrc source %

" detect go
autocmd BufNewFile,BufReadPost *.go set filetype=go
