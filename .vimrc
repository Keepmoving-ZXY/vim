if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

syntax on

set so=7
set cc=80
set ruler       " show the cursor position all the time
set number
set t_Co=256
set history=50      " keep 50 lines of command line history
set autochdir
set nocompatible    " Use Vim defaults (much better!)
set background=dark
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
colorscheme PaperColor 
set bs=indent,eol,start     " allow backspacing over everything in insert mode
set statusline=[%F]\ [%{&ff}]

set laststatus=2
set expandtab
set shiftwidth=2
set softtabstop=2

set wrap
set autoindent
set nohlsearch
set nofoldenable

nmap <C-i> :vsp<CR><C-w>l<leader>f
nmap <C-t> :tabedit<CR>
nmap <C-n> :tabn<CR>
nmap <C-p> :tabp<CR>

"
" this will lead to vim too slow 
"
" set foldmethod=syntax

"configure of PaperColor"
let g:PaperColor_Theme_Options = {
            \     'cpp': {
            \       'highlight_standard_library': 1
            \     },
            \     'c': {
            \       'highlight_builtins' : 1
            \     }
            \   }

filetype off                    " required!
call plug#begin('~/.vim/autoload')

Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'NLKNguyen/papercolor-theme'
Plug 'Yggdroot/LeaderF'
Plug 'Yggdroot/indentLine'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Chiel92/vim-autoformat'

"indent line"
let g:indentLine_enabled = 1

"configure of nerdcommenter"
let g:NERDSpaceDelims=1
let g:NERDAltDelims_c = 1

"tagbar"
nmap <F9> :TagbarToggle<CR>
let g:tagbar_left = 0
let g:tagbar_width = 60
let g:tagbar_autoclose = 1
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }

"NERDTree"
nmap <leader>f :NERDTreeToggle<CR>
let NERDTreeWinPos='left'
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=31
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.ycm_extra_conf.py','\GPATH','\GRTAGS','\GTAGS','\build']
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeStatusline=1
let g:NERDTreeDirArrowExpandable = '*'
let g:NERDTreeDirArrowCollapsible = '*'

"YouCompleteMe"
set completeopt=longest,menu
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_show_diagnostics_ui=0
let g:ycm_min_num_of_chars_for_completion=3 
let g:ycm_complete_in_strings = 1
let g:ycm_key_invoke_completion = '<C-p>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>>'
nmap <F4> :YcmDiags<CR>

"leaderf"
nmap <leader>f :LeaderfFile<CR>
nmap <C-f> :LeaderfFunction<CR>
nmap <C-l> :LeaderfLine<CR>
nmap <C-r> :LeaderfFile PROJECT_ROOT_DIR<CR>

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','build'],
            \ 'file': ['.o','.cmd','.a']
            \}

"vim-gutentags"
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_project_root = ['.root', '.svn', '.git']
   
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"map ctag navigate key"
map <C-g> <C-]>

"vim autoformat"
" ensure that you have installed clang-format and auto-pep8
noremap <F4> :Autoformat<CR>                                                       
let g:autoformat_autoindent = 0                                                    
let g:autoformat_retab = 0                                                         
let g:autoformat_remove_trailing_spaces = 0

call plug#end()
