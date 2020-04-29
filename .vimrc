"Environment
set nocompatible
syntax on
filetype off
filetype plugin indent on
set colorcolumn=80
set gdefault
set hlsearch
set ignorecase
set incsearch
set ls=2
set nobackup  "No swp file
set nu
set ru
set shiftround
set shortmess+=A
set showmatch
set smartindent
set statusline+=%F
set shellcmdflag=-ic "Recognize bash aliases
set wildmenu
set wildmode=full
autocmd BufWritePre * :%s/\s\+$//e

"Indenting and editing
set autoindent
set expandtab
set hlsearch
set nojoinspaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set textwidth=120

"Plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ceedubs/sbt-ctags'
Plugin 'Chiel92/vim-autoformat'
Plugin 'fatih/vim-go'
Plugin 'jstemmer/gotags'
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'roxma/vim-paste-easy'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplcache.vim'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'SuperTab'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
"Plugin 'w0rp/ale'
call vundle#end()

"Mac only
cmap cpp w !pbcopy<CR><CR>

"Tabs
nmap == gt
nmap -- gT
cmap tb tabe<CR>
cmap tcc tabclose<CR>
nmap <C-e> <C-t>

"Splits
nmap <leader>h :sp<ENTER>
nmap <leader>v :vsp<ENTER>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-=> <C-w>=
nmap <C-t> <C-w>T

"Convenience Mappings
imap ii <Esc>
vmap ii <Esc>
nnoremap I ^i
nmap p ]p
nmap P ]P
nmap <leader>0 ggvGzo
nmap <leader>z :w<ENTER><C-z>
nnoremap <Space> :
vmap <Space> :
nmap ff G
nnoremap <Leader>w $D
nnoremap bb A;<Esc>:w<Esc>
noremap <Leader>u gUU
cmap ww w<CR>

cmap soo so %<CR>
cmap qa qa<CR>
cmap qq q<CR>
noremap tt <C-t>
cmap wq wq<CR>
cmap q! q!<CR>
cmap spp set paste<CR>
cmap nspp set nopaste<CR>
nmap [[ <C-]>
nmap M $i
cmap J JSHint<CR>
map <F1> <C-d>
map <F2> <C-u>
nmap <F3> G$
nmap <F4> GA
nmap <F5> Go
nmap <F8> ;

nnoremap <Leader>s <C-\>s

inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()


"Disable Arrow Keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>


"Convenience Macros
cnoremap ppq <Esc>P>i{dd
cnoremap bb <Esc>:tabe<Enter>:e ~/.bashrc<Enter>
cnoremap vv <Esc>:tabe<Enter>:e ~/.vimrc<Enter>

"Delete whitespace
autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab  "Yaml


"CtlrP
let g:ctrlp_map = 'pp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_regexp = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

"Neocomplcache
let g:neocomplcache_enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif


"Nerdcommenter convenience mappings
nmap <Leader>f <Leader>cc
nmap <Leader>d <Leader>cu


"Vim syntax highlighting
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>
autocmd BufRead,BufNewFile *.go set filetype=go
autocmd BufRead,BufNewFile *.less set filetype=less
autocmd BufRead,BufNewFile *.scala set filetype=scala
autocmd BufRead,BufNewFile *.sdl set filetype=sdl


"Vim-signature marks
"nmap <C-e> m/

"Fugitive Convenience Mappings
cmap gbb Gblame<CR>
cmap gdd Gdiff<CR>
cmap gdn Gdiff master<CR>


"Solarized dark configuration - requires solarized.vim in ~/.vim/colors
set background=dark
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
let g:solarized_termcolors=16
colorscheme solarized


" Tagbar.
nnoremap <leader>to :TagbarToggle<CR>
nnoremap <leader>tp :TagbarTogglePause<CR>
let g:tagbar_left = 1
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds'     : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions'
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind' : {
    \ 'ctype' : 't',
    \ 'ntype' : 'n'
  \ },
  \ 'ctagsbin'  : 'gotags',
  \ 'ctagsargs' : '-sort -silent'
  \ }

" ALE.
"let g:ale_linters = {
"\  'go': ['gofmt', 'golint', 'govet', 'golangserver'],
"\  'python': ['flake8', 'mypy', 'pylint', 'pyls'],
"\  'rust': ['rls'],
"\}
"let g:ale_fixers = {
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
"\  'go': ['goimports', 'gofmt'],
"\  'rust': ['rustfmt'],
"\}
"let g:ale_go_gofmt_options = '-s'
"let g:ale_rust_rls_toolchain = 'stable'
"let g:ale_fix_on_save = 1
"let g:airline#extensions#ale#enabled = 1
"let g:ale_set_highlights = 1
"let g:ale_sign_column_always = 1
"let g:ale_completion_enabled = 1
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"nnoremap <silent> <leader>h :ALEHover<CR>
"nnoremap <silent> <leader>g :ALEGoToDefinition<CR>
"nnoremap <silent> <C-m> :ALEPreviousWrap<CR>
"nnoremap <silent> <C-n> :ALENextWrap<CR>


"Go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
au FileType go nmap <leader>gt :GoDeclsDir<cr>

let g:go_fmt_command = "goimports"
"let g:go_version_warning = 0
let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1
"let g:go_auto_sameids = 1
"let g:go_auto_type_info = 1
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:go_addtags_transform = "snakecase"
