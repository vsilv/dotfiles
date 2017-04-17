" 
" Last modified: Mon Mar 20, 2017  04:48PM
"


set nocompatible "Use Vim settings, rather than Vi settings
command! W :w


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"general stuff
Plugin 'gmarik/Vundle.vim'


"
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'

""syntax check
"Plugin 'scrooloose/syntastic'
"
" C++ 
Plugin 'octol/vim-cpp-enhanced-highlight'


"Autobraces
Plugin 'jiangmiao/auto-pairs'

" needs to be recompiled ...
Plugin 'Valloric/YouCompleteMe'

Plugin 'jeaye/color_coded'
Plugin 'JuliaLang/julia-vim'

"Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'


"indending
"Plugin 'Yggdroot/indentLine'



"colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'
Plugin 'edkolev/promptline.vim'

" latex
Plugin 'lervag/vimtex'

"Markers
Plugin 'kshenoy/vim-signature'


"snippets 
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Spell Correction
Plugin 'reedes/vim-lexical'

" Movement 
Plugin 'reedes/vim-wheel'
Plugin 'justinmk/vim-sneak'

"Markdown
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-pencil'
"Plugin 'vim-pandoc/vim-pandoc-syntax' 
"Plugin 'vim-pandoc/vim-pandoc'



call vundle#end()

filetype plugin on
"stop using esc in insert mode
inoremap jk <esc>
inoremap kj <esc>
inoremap <esc> <nop>

filetype plugin indent on "required!
"tagbar
nmap <F8> :TagbarToggle<CR>

" Nerd tree with git
nmap <C-u> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Some symbols
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" If vim starts unspecified, it will start with NERDtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"markdown
let g:vim_markdown_math=1

""Neocomplete
"inoremap <expr><c-q>  pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:acp_enableAtStartup = 0
"let g:neocomplete#enable_at_startup = 1
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
  "let g:neocomplete#sources#omni#input_patterns = {}
"endif

"let g:neocomplete#sources#omni#input_patterns.tex =
"\ '\v\\\a*(ref|cite)\a*([^]]*\])?\{([^}]*,)*[^}]*'
"


"
" YouCompleteMe options
"
let g:Show_diagnostics_ui = 1 "default 1

let g:ycm_server_python_interpreter = 'python2'

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
"let g:ycm_confirm_extra_conf = 1

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']

let g:UltiSnipsExpandTrigger = "<C-l>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

let g:ycm_warning_symbol = '!!'
let g:ycm_error_symbol = '>>'

let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'jl' : 1
      \}
map <C-n> :YcmCompleter GoTo<CR>

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
  endif
  let g:ycm_semantic_triggers.tex = [
        \ 're!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*'
     \ ]


" Cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1

" Julia
autocmd BufRead,BufNewFile *.jl      set filetype=julia

autocmd BufEnter *                   call LaTeXtoUnicode#Refresh()
autocmd FileType *                   call LaTeXtoUnicode#Refresh()

autocmd VimEnter *                    call LaTeXtoUnicode#Init()
"Ultisnippet"s
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsEditSplit = 'horizontal'

"""Syntastic settings
"let g:statline_syntastic = 0
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*



"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

""let g:statline_syntastic = 0
"let g:syntastic_always_populate_loc_list = 0

"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


"let g:UltiSnipsEditSplit = 'horizontal'
" Solarized 
syntax enable "syntax highlighting
set t_Co=256
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'
let g:airline_section_x = '%{PencilMode()}'

let g:promptline_theme = 'airline'
let g:promptline_preset = {
    \'a'    : ['ψ %#'],
    \'b'    : ['%T'],
    \'c'    : [ '%2~'],
    \'warn' : [ promptline#slices#last_exit_code() ],
    \'z'    : [ promptline#slices#vcs_branch() ]}


"tmuxline
let g:tmuxline_preset = {
      \'a'    : 'Λ',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : ['#(sensors | head -3 | tail -1 | cut -c16-24)','#(free -m | head -2 | tail -1 | cut -c28-31)/#(free -m | head -2 | tail -1 | cut -c16-19)' ],
      \'y'    : '%R %a, %d.%m.%y',
      \'z'    : '#(acpi -b | grep -Eo "[0-9]+%")'}

" Paste with F2
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" Open vim at the same position as before
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 

" This tries to synchronize vim with the clipboard
set clipboard=unnamed

let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"


let g:latex_view_general_options = shellescape("-s -x '" . exepath(v:progpath) . " --servername " . v:servername . " +{%line} {%input}'")

" Spell check
augroup lexical
  autocmd!
  autocmd FileType markdown,tex,latex,txt call lexical#init() 
                                \ |  call pencil#init()
augroup END

let g:tex_flavor = "latex"
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#textwidth = 20

let g:lexical#spelllang = ['en_us', 'de_de',]
let g:lexical#thesaurus = ['~/.vim/thesaurus/mthesaur.txt', '~/.vim/thesaurus/openthesaurus.txt']
let g:lexical#dictionary = ['~/.vim/spell/en.utf-8.add', '~/.vim/spell/de.utf-8.add']
let g:lexical#dictionary = ['/usr/share/dict/words', '/usr/share/dict/german']




" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set backspace=indent,eol,start "allow backspacing over everything in insert mode

set history=50 "keep 50 lines of command line history

set ruler "show the cursor position all the time

set showcmd "display incomplete commands

set incsearch "do incremental searching

set nu "show line numbers

" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

"set si "Smart indent
set wrap "Wrap lines
set ai "Auto indent

" Show lines for indents
let g:indentLine_char = '┆'


set hlsearch "highlight search terms



set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching

set cmdheight=3 "The commandbar height

set showmatch "Show matching bracets when text indicator is over them

set nobackup " do not keep backup files, it's 70's style cluttering
set noswapfile " do not write annoying intermediate swap files

set laststatus=2 " Solves: statusline does not appear until I create a split

set ttimeoutlen=50 "Solves: there is a pause when leaving insert mode

" brackets will be shown for 2 seconds
set mat=2

" get rid of mode indicator
set noshowmode

set splitbelow " Horizontal splits open below current file
set splitright " Vertical splits open to the right of the current file


" Date
"
" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}Last modified: \).*#\1' .
          \ strftime('%a %b %d, %Y  %I:%M%p') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()
"buffer
noremap <S-Tab> :bnext<CR>
" For jumping out of paranthesis
inoremap <C-e> <C-o>A

