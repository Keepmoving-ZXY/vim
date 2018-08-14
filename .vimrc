if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

syntax on
set ts=4
set so=7
set cc=80
set ruler       " show the cursor position all the time
set number
set cindent
set t_Co=256
set expandtab
set autoindent
set history=50      " keep 50 lines of command line history
set autochdir
set nocompatible    " Use Vim defaults (much better!)
set shiftwidth=4
set background=dark
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
colorscheme PaperColor 
set bs=indent,eol,start     " allow backspacing over everything in insert mode
set statusline=[%F]\ [%{&ff}]

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftwidth=4
set laststatus=2

set wrap
set nohlsearch
set nofoldenable

"
" this will lead to vim too slow 
"
" set foldmethod=syntax

nmap <C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-h> :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <F8> :!gtags <CR><CR>

nmap <C-i> :vsp<CR>:<ESC><C-w>l

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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'DoxygenToolkit.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'NLKNguyen/papercolor-theme'
Bundle 'Yggdroot/LeaderF'
Bundle 'Yggdroot/indentLine'
Bundle 'Shougo/deol.nvim'
" Bundle 'davidhalter/jedi-vim'

"unite"
" let g:unite_source_history_yank_enable = 1

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" nnoremap <C-l> :<C-u>Unite -no-split -buffer-name=lines -start-insert line<cr>
" " nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>
" autocmd FileType unite call s:unite_settings()
" function! s:unite_settings()
    " let b:SuperTabDisabled=1
    " imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    " imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
" endfunction

"indent line"
let g:indentLine_enabled = 1

" cscope
set cscopetag
set cscopeprg='gtags-cscope'
let GtagsCscope_Auto_Update = 0
let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

"content of make_file_list.sh is:"
"find source_code_path -path \"dictionary_ignore\" -prune -o -type f -print > /tmp/gtags.files"
"this script generate a file list with ignore files in specific dictionary,"
"and file list will be used by gtags"
nmap <F7> :!make_file_list.sh && gtags -f /tmp/gtags.files & <CR><CR>
nmap <F8> :!gtags & <CR><CR>

"configure of nerdcommenter"
let g:NERDSpaceDelims=1
let g:NERDAltDelims_c = 1

"configure of tagbar"
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

"configure of NERDTree"
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

"configure of YouCompleteMe"
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=2 
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

"config of leaderf"
nmap <C-l> :LeaderfLine<CR>
nmap <C-r> :LeaderfFile /home/zxy/sflagent_c7/branches/sflagent_lenovo_dongde_v0<CR>
nmap <C-f> :LeaderfFile<CR>
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','build'],
            \ 'file': ['.o','.cmd','.a']
            \}

"Deol.vim"
nmap <leader>s :Deol<CR>
nmap <leader>q :q<CR>

filetype plugin indent on
