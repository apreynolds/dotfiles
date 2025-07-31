"-----------------------------------------
"{{{ SEE ALSO:

" (RECALL that <leader>gf will open these files in new tab)

"AFTER: for custom filetype-specific commands
" ~/.vim/after/ftplugin/tex.vim
" ~/.vim/after/ftplugin/markdown.vim
" ~/.vim/after/ftplugin/song.vim
" ~/.vim/after/ftplugin/vimwiki.vim

" SYNTAX: for colors, isk settings
" ~/.vim/after/syntax/tex.vim
" ~/.vim/after/syntax/sh.vim
" ~/.vim/after/syntax/html.vim
" ~/.vim/after/syntax/todo.vim

"}}} 
"-----------------------------------------
" Enabling filetype support provides filetype-specific indenting,
" syntax highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" `matchit.vim` is built-in so let's enable it!
" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim
" :Man command will open man file for command in vimc
runtime ftplugin/man.vim

set viminfofile=~/.vim/viminfo

"-----------------------------------------
"{{{ BASIC functionality:

set nomodeline                   " (I read a thread that suggested modelines could be a security risk; follow up on this later)
set hidden                       " Possibility to have more than one unsaved buffers.
set splitright splitbelow        " Open splits below, and to the right
set backspace=indent,eol,start " Intuitive backspace behavior.

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Saving options in session and view files causes more problems than it solves, so disable it.
set sessionoptions-=options
set viewoptions-=options

set sessionoptions+=globals " Ensure sessions save tabnames (necessary for Taboo plugin)

"}}}
"-----------------------------------------
"{{{ BASIC look and feel:
set autoindent                 " Minimal automatic indenting for any filetype.
set wildmenu                   " Great command-line completion, use `<Tab>` to move around and `<CR>` to validate.
set wildmode=longest,list,full " Command line tab completion

set number relativenumber " Lines numbered relative to cursor
set tabstop=4             " 4 spaces (default is 8)
set expandtab             " Replace tabstops with spaces
set shiftwidth=2          " Sets indentation to 2 spaces (default is 8)
set linebreak breakindent " Breaks lines at whitespace, and indent
set showbreak=..          " Indentation of a linebreak is indicate with ..
set ruler                 " Shows the current line number at the bottom-right of the screen.
set showmatch             " Briefly show matching bracket

set conceallevel=2   " Hides bold markers, $ in math mode, etc.
set laststatus=2     " Necessary for statusline
set showcmd          " Show (partial) command in last line
set scrolloff=2      " Keep 2 lines visible at top/bottom when scrolling
set noshowmode       " Showmode is unnecessary when using airline
set formatoptions+=j " Delete comment character when joining commented lines.

autocmd BufNewFile,BufRead *.txt setlocal tw=80

"MAXIMIZE WINDOW:
nnoremap <C-W>m <C-W>\|<C-W>_ 

"}}}
"-----------------------------------------
"{{{ BASIC searching
set incsearch  " Incremental search, hit `<CR>` to stop.
set ignorecase " Ignore case when searching
set smartcase  " Case-sensitive searching when uppercase letters are present
set hlsearch   " for vim-cool
"set shortmess-=S " instead of indexed-search plugin
"}}}
"-----------------------------------------
"{{{ Leader
let mapleader = ","
" local leader is used for e.g. filetype plugins:
let maplocalleader = "," "same
" older experiment:
"let maplocalleader = "\<Space>"
"}}}
" -----------------------------------------
"{{{ Vim-plug
call plug#begin()
"To disable a plugin, append , {'on': []}, e.g.  Plug 'vimwiki/vimwiki', {'on': []}
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdcommenter'
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'junegunn/vim-easy-align'
"Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-obsession' 
Plug 'tpope/vim-dispatch' "keymaps disabled
Plug 'vimwiki/vimwiki'
Plug 'freitass/todo.txt-vim', { 'frozen': 1 } "Plugin was last updated in 2016, and I've made local changes to it, so don't update it.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'embear/vim-foldsearch'
Plug 'gcmt/taboo.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'artnez/vim-wipeout'
Plug 'christoomey/vim-tmux-navigator'
Plug 'TaDaa/vimade', {'on': []} "2025-05-18 encountered error when sourcing vimrc, so have disabled (unimportant plugin)
Plug 'preservim/nerdtree'
Plug 'tpope/vim-eunuch'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'voldikss/vim-floaterm', {'on': []} "2025-06-10 I no longer need this, as FZF and Rg (and tmux) achieve the same goals
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'romainl/vim-cool'
Plug 'nanotee/zoxide.vim'
Plug 'preservim/vim-markdown'
Plug 'AndrewRadev/bufferize.vim'
Plug 'kshenoy/vim-signature' "for marks
"Plug 'dominickng/fzf-session.vim', {'on': []}
Plug 'Tarmean/fzf-session.vim'
call plug#end()
"}}}
"-----------------------------------------
"{{{ Colors
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
colorscheme gruvbox

"highlight NonText ctermfg=bg
"highlight VertSplit ctermfg=bg
"highlight Folded ctermbg=236
"}}}
"-----------------------------------------
"{{{ plugin: Dispatch
let g:dispatch_no_maps = 1
"}}}
"-----------------------------------------
"{{{ plugin: Foldsearch
"DISABLE MAPPINGS: (I only use one)
let g:foldsearch_disable_mappings = 1
"ENABLE FW:
nnoremap <leader>fw :Fw<cr>
"}}}
"-----------------------------------------
"{{{ plugin: Fugitive
" Keymaps for fugitive commands: 
" Git commit (including message; if I want a description just delete the -m "):
nnoremap <leader>gc :Git commit -m "
nnoremap <leader>gC :Git commit<cr>
nnoremap <leader>gb :Git branch 
nnoremap <leader>gk :Git checkout 
nnoremap <leader>gt :Git tag 
nnoremap <leader>gm :Git merge  
"}}}
"-----------------------------------------
"{{{ plugin: EasyAlign
"TODO learn how to use this
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
"-----------------------------------------
"{{{ plugin: Goyo
inoremap <leader>gg :Goyo<cr>
nnoremap <leader>gg :Goyo<cr>

let g:goyo_height = '90%'
let g:goyo_width = 100
let g:goyo_linenr = 1

function! s:goyo_enter()
  silent !tmux set status off
  set showmode
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  set noshowmode
  highlight NonText ctermfg=bg
  highlight VertSplit ctermfg=bg
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
"}}}
"-----------------------------------------
"{{{ plugin: FZF, Rg
let g:fzf_action = {
      \ 'ctrl-t': '$tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-o': 'Start! open' }
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }

nnoremap <leader>bb :Buffers<cr>

"run Files in cwd (default)
nnoremap <leader>ff :FilesVCS<cr>
nnoremap <leader>fh :FilesVCSandHidden<cr>
nnoremap <leader>ft :FilesVCSTextOnly<cr>

"run Files in $HOME:
nnoremap <leader>f<leader>f :FilesVCS ~<cr>
nnoremap <leader>f<leader>h :FilesVCSandHidden ~<cr>
nnoremap <leader>f<leader>t :FilesVCSTextOnly ~<cr>

"run Files in directory of current buffer:
"nnoremap <leader>fb :FilesIncludeVCS %:p:h<cr>

"modified Files (don't ignore .gitignore files, so I can open e.g. pdfs)
command! -bang -nargs=? -complete=dir FilesVCS call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': 'fd --no-ignore-vcs'}), <bang>0)
"run Files, include hidden files/directories
command! -bang -nargs=? -complete=dir FilesVCSandHidden call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': 'fd --no-ignore-vcs --hidden'}), <bang>0)
"run Files, but only on specific text files
command! -bang -nargs=? -complete=dir FilesVCSTextOnly call fzf#vim#files(<q-args>, fzf#vim#with_preview({'source': 'fd --no-ignore-vcs --ignore-file ~/.config/fd/ign-except-text'}), <bang>0)

"run Rg in cwd (default)
nnoremap <leader>rg :Rg <cr>
nnoremap <leader>rt :RgTextOnly <cr>
nnoremap <leader>rd :RgDiary <cr>
nnoremap <leader>rh :RgTextOnlyIncludeHidden <cr>
"run Rg in $HOME:
nnoremap <leader>r<leader>g :RgHome <cr>
nnoremap <leader>r<leader>t :RgTextOnlyHome <cr>
nnoremap <leader>r<leader>h :RgTextOnlyIncludeHiddenHome <cr>

"run Rg in cwd only on specific text files:
command! -bang -nargs=* RgTextOnly call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --ignore-file ~/.config/fd/ign-except-text -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview(), <bang>0)',
"run Rg in diary of current wiki, only on specific text files:
command! -bang -nargs=* RgDiary call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --ignore-file ~/.config/fd/ign-except-text -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview({'dir': '~/0twc/diary'}), <bang>0)',
"run Rg in cwd, only on specific text files, include zz-* directories
command! -bang -nargs=* RgTextOnlyIncludeHidden call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --ignore-file ~/.config/fd/ign-except-text -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview(), <bang>0)',

"run Rg in $HOME:
command! -bang -nargs=* RgHome call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview({'dir': '~'}), <bang>0)',
"run Rg in $HOME only on specific text files:
command! -bang -nargs=* RgTextOnlyHome call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --ignore-file ~/.config/fd/ign-except-text -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview({'dir': '~'}), <bang>0)',
"run Rg in $HOME, only on specific text files, include zz-* directories
command! -bang -nargs=* RgTextOnlyIncludeHiddenHome call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --ignore-file ~/.config/fd/ign-except-text -- ".fzf#shellescape(<q-args>), fzf#vim#with_preview({'dir': '~'}), <bang>0)',

"}}}
"-----------------------------------------
"{{{ plugin: Airline
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline_powerline_fonts=1

"NOTE: couldn't get the airline obsession status to work, but will abandon.
"See https://github.com/vim-airline/vim-airline/issues/777
"let g:airline#extensions#obsession#enabled = 1

" Change theme with :AirlineTheme
let g:airline_theme='gruvbox'
"let g:airline_theme='bubblegum'
"let g:airline_theme='raven'
let g:airline#extensions#tmuxline#enabled = 1
"}}}
"-----------------------------------------
"{{{ plugin: Taboo
let g:taboo_tabline=1 "for taboo to work with airline
let g:taboo_tab_format="%N%U %f%m" " Naming format for tabs
let g:taboo_renamed_tab_format="%N%U %l%m" " Naming format for renamed tabs
"let g:taboo_tab_format="%N:%f%m" " Naming format for tabs
"let g:taboo_renamed_tab_format=" %N:%l%m" " Naming format for renamed tabs

nnoremap <leader>tr :TabooRename 
"the $ will place the tab last:
nnoremap <leader>tn :$tabnew<CR>
nnoremap <leader>tm :tabm
"}}}
"-----------------------------------------
"{{{ plugin: Tmuxline
let g:tmuxline_separators = {
      \ 'left' : "",
      \ 'right' : "",
      \ 'space' : ' '}
let g:tmuxline_preset = {
      \'a'    : '',
      \'b'    : '%a %d %b',
      \'c'    : '%R',
      \'win'  : ['#I', '#W'],
      \'cwin'  : ['#I', '#W'],
      \'x'    : '#(battery)',
      \'y'    : '#S' ,
      \'z'    : '' }
"}}}
"-----------------------------------------
"{{{ PLUGIN: vimtex, and other tex stuff
"-----------------------------------------

let g:tex_flavor='latex' "new tex files will have ft set to tex

let g:vimtex_toc_todo_labels = {'TODO': 'TODO: ', 'FIXME': 'FIXME: ', 'NOTE': 'NOTE: '}

autocmd BufNewFile,BufRead *.cls set filetype=tex
"autocmd BufNewFile,BufRead *.cfg set filetype=tex

" 2024-10-07 Started using ".song" filetype for music songsheets, as it's better for custom snippets and compilation commands. Note that ft=song.tex set filetype to both song and tex, and syntax to tex
autocmd BufNewFile,BufRead *.song set filetype=song.tex

let g:vimtex_compiler_latexmk = {
      \ 'callback' : 1,
      \ 'continuous' : 1,
      \ 'executable' : 'latexmk',
      \ 'hooks' : [],
      \ 'options' : [
      \   '-verbose',
      \   '-file-line-error',
      \   '-synctex=0',
      \ ],
      \}

let g:vimtex_fold_enabled=1
let g:vimtex_fold_manual=1
let g:vimtex_fold_types = {
      \ 'items' : {'enabled' : 0},
      \  'cmd_single' : {
      \      'cmds' : [
      \        'solutionbox',
      \        'notebox',
      \        'currentupdatebox',
      \        'structure',
      \        'chords',
      \        'lyrics',
      \        'lyricswithchords',
      \      ],
      \    },
      \ 'envs' : {
      \   'blacklist' : ['enumerate','itemize'],
      \   'whitelist' : [],
      \ },
      \ }

"2025-07-07 filter out warnings related to fontaxes; prompted by baskervaldx
let g:vimtex_quickfix_ignore_filters = [
      "\ 'Package fontaxes Warning: Axis ',
      "\ 'Marginpar on page',
      "\ 'Label(s) may have changed',
      "\ 'Exercise properties may have changed',
      \]

let g:tex_isk='48-57,a-z,A-Z,192-255,:,-,_,'

let g:vimtex_syntax_conceal = {
      \ 'accents': 1,
      \ 'ligatures': 1,
      \ 'cites': 1,
      \ 'fancy': 1,
      \ 'spacing': 0,
      \ 'greek': 1,
      \ 'math_bounds': 1,
      \ 'math_delimiters': 1,
      \ 'math_fracs': 1,
      \ 'math_super_sub': 1,
      \ 'math_symbols': 1,
      \ 'sections': 0,
      \ 'styles': 1,
      \}

let g:vimtex_syntax_custom_cmds = [
      \ {'name': 'texttt', 'conceal': 1, 'argstyle': 'under'},
      \ {'name': 'lstinline', 'conceal': 1, 'argstyle': 'italunder'},
      \]
"-----------------------------------------
"}}}
"-----------------------------------------
"{{{ plugin: Ultisnips
let g:UltiSnipsEditSplit='context'
"let g:UltiSnipsListSnippets='<C-u>'
let g:UltiSnipsExpandTrigger='<s-tab>'

autocmd BufNewFile,BufRead *tex.snippets setlocal foldmarker=<<<,>>>
autocmd BufNewFile,BufRead *tex.snippets setlocal foldmethod=marker
map <F3> :UltiSnipsEdit<CR>
"}}}
"-----------------------------------------
"{{{ plugin: Wipeout
" Closes all buffers not in windows
nnoremap <leader>wo :Wipeout<CR>
"}}}
"-----------------------------------------
"{{{ plugin: Obsession and fzf-session 

"NOTE: Using 'Tarmean/fzf-session.vim', after previously trying 'dominickng/fzf-session.vim'; the former is a little newer.
"I mistakenly thought that the latter would obviate the need for Obsession, but I was wrong: Obsession provides the crucial "auto-save sessions" functionality.
"While it may be possible to get the latter working the way I want with Obsession, I won't bother trying as the function below allows the behaviour I want, namely:
"- Unload the current session and wipeout all the hidden buffers
"- Load a new session (fuzzy)

map <leader>oo :Obsession ~/.vim/sessions/
map <leader>os :echo ObsessionStatus()<cr>

map <leader>ss :call SessUnloadWipeoutLoad()<cr>

"Custom function to unload, wipeout, and load new session:
function! SessUnloadWipeoutLoad()
  "Unload the current session:
  execute 'SessionUnload' 
  "Wipeout all hidden buffers so they won't be in the next session:
  execute 'Wipeout'
  "Load a new session:
  execute 'SessionLoad'
endfunction
"}}}
"-----------------------------------------
"{{{ Diff (and mappings)
"-----------------------------------------

"diff options 2015-07-18
"Note that 'dp' puts, and 'do' obtains
if &diff
  " diff mode
  set diffopt+=iwhite " ignore changes in amount of whitespace
endif

nnoremap <leader>dt :diffthis<CR>
nnoremap <leader>do :diffoff<CR>

"-----------------------------------------
"}}} end DIFF
"-----------------------------------------
"{{{ Mappings: Inserting date/time
inoremap <F1> <C-R>=strftime("%F")<CR>
nnoremap <F1> <C-R>=strftime("%F")<CR>
"}}} end Inserting date/time
"-----------------------------------------
"{{{ MISC: launching external scripts
"-----------------------------------------
nnoremap <leader>sy :Start! sync2onedrive
"-----------------------------------------
"}}} end MISC
"-----------------------------------------
"{{{ plugin: Vimwiki
"-----------------------------------------

let g:vimwiki_folding='expr' "2019-07-17 'list' is another option; see documentation
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_global_ext = 0
let g:vimwiki_user_htmls = 'courses.html,IIindex.html,math.html,video.html,contact.html'
let g:vimwiki_valid_html_tags = 'a,b,i,s,u,sub,sup,kbd,br,hr,div,center,strong,em,iframe,span,script,h1,audio,source,table,tr,th,td'
let g:vimwiki_toc_header = 'contents'
let g:vimwiki_key_mappings =
      \ {
      \   'table_mappings': 0,
      \ }
let g:vimwiki_ext2syntax = {'.mkdn': 'markdown',
      \  '.mdwn': 'markdown', '.mdown': 'markdown',
      \  '.markdown': 'markdown', '.mw': 'media'} "2025-05-23 removed .md from list, so that vimwiki wouldn't auto-generate html for .md files

nnoremap <localleader>vc :VimwikiTOC<CR>

nnoremap <localleader>vt :call MyVimwikiTabnewLink()<cr>
function! MyVimwikiTabnewLink()
  execute 'VimwikiTabnewLink'
  execute 'tabmove $'
endfunction

nnoremap <localleader>vv :VimwikiVSplitLink<CR>

"OBSOLETE:
"nnoremap <localleader>vg :VimwikiGenerateTagLinks<CR>
"nnoremap <localleader>vs :VimwikiSearchTags

nnoremap <localleader>vk :VimwikiDiaryNextDay<CR>
nnoremap <localleader>vj :VimwikiDiaryPrevDay<CR>

"HTML FILETYPE AUTOCMD: for thtml (template) files
autocmd BufNewFile,BufRead *.thtml set filetype=html

"-----------------------------------------
"{{{ InitializeWikis
"-----------------------------------------
nnoremap <localleader>iw :call InitializeWikis()<CR>

function! InitializeWikis()
  execute 'e ~/0twc/twc.wiki'
  execute 'lcd %:p:h'
  execute 'sp +3 ~/0twc/TAGS.wiki'
  execute 'foldopen'
  execute 'vs +2 ~/0twc/diary/diary.wiki'
  execute 'foldopen!'
  execute 'wincmd L'
  execute 'wincmd h'
  execute 'TabooRename twc'
  execute 'tabfirst'
endfunction

"-----------------------------------------
"}}} end InitializeWikis
"-----------------------------------------
"{{{ VimwikiLinkHandler
"-----------------------------------------
function! VimwikiLinkHandler(link)
  " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
  "   1) [[vfile:~/Code/PythonProject/abc123.py]]
  "   2) [[vfile:./|Wiki Home]]
  let link = a:link
  if link =~# '^vfile:'
    let link = link[1:]
  else
    return 0
  endif
  let link_infos = vimwiki#base#resolve_link(link)
  if link_infos.filename == ''
    echomsg 'Vimwiki Error: Unable to resolve link!'
    return 0
  else
    "exe 'vsplit ' . fnameescape(link_infos.filename)
    exe '$tabnew ' . fnameescape(link_infos.filename)
    return 1
  endif
endfunction
"-----------------------------------------
"}}} end VimwikiLinkHandler
"-----------------------------------------
"{{{ Setting up the wikis
"-----------------------------------------
let $myrx_todo = '\C\<\%(TODO\|\|DONE\|\|STARTED\|\|FIXME\|\|FIXED\|\|XXX\|\|NOTE\|\)\>'
"default: '\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|XXX\)\>'

let twc = {}
let twc.path = '~/0twc/'
let twc.path_html = '~/0twc/'
let twc.diary_rel_path = 'diary/'
let twc.index = 'twc'
let twc.css_name = '.wikiconfig/style_www/style.css'
let twc.template_path = '~/0twc/.wikiconfig/'
let twc.rx_todo = $myrx_todo
let twc.template_default = 'def_template'
let twc.template_ext = '.thtml'
let twc.auto_tags = 1
let twc.auto_export = 1
let twc.auto_diary_index = 1

let music = {}
let music.path = '~/4music/'
let music.path_html = '~/4music/'
let music.diary_rel_path = 'diary/'
let music.index = 'musicwiki'
let music.css_name = '.wikiconfig/style_www/style.css'
let music.template_path = '~/4music/.wikiconfig/'
let music.template_default = 'def_template'
let music.rx_todo = $myrx_todo
let music.template_ext = '.thtml'
let music.auto_tags = 1
let music.auto_export = 0
let music.auto_diary_index = 1

let music_website = {}
let music_website.path = '~/5music_website/'
let music_website.path_html = '~/5music_website/'
let music_website.css_name = 'style_www/style.css'
let music_website.template_path = '~/5music_website/wikiconfig/'
let music_website.template_default = 'def_template'
let music_website.template_ext = '.thtml'
let music_website.auto_export = 1

let work_website = {}
let work_website.path = '~/6work_website/'
let work_website.path_html = '~/6work_website/'
let work_website.css_name = 'style_www/style.css'
let work_website.template_path = '~/6work_website/wikiconfig/'
let work_website.template_default = 'def_template'
let work_website.template_ext = '.thtml'
let work_website.auto_export = 1

let g:vimwiki_list = [ twc, music, music_website, work_website ]

"-----------------------------------------
"}}} end Setting up the wikis
"-----------------------------------------
"{{{ Tags customizations
"-----------------------------------------

" MyVimwikiGenerateTags; cleans up vimwiki tag link formatting
function! MyVimwikiGenerateTags()
  "clear .vimwiki_tags beforehand
  execute 'Start! rm .vimwiki_tags_bak2 && mv .vimwiki_tags_bak1 .vimwiki_tags_bak2 && mv .vimwiki_tags .vimwiki_tags_bak1'
  "Replace == :tag: == with == tag == so that VimwikiRebuildTags! doesn't 'see' these tags, then write the file and pause
  execute '%s/== :\(.*\): ==/== \1 ==/'
  execute "write"
  sleep 1
  "Use built-in function to rebuild tags on all files:
  execute 'VimwikiRebuildTags!'
  "Use built-in function to generate tags:
  execute 'VimwikiGenerateTagLinks'
  "Move to Generated Tags heading:
  execute 'g/= Generated Tags ='
  "From heading to end of file, on lines not containing "/" (thus excluding files in subdirectories), re-format the link so that it appears as HEADING (FILE)
  "(Assumes filename consists only of letters, numbers, dashes, underscores, spaces, dots)
  "execute '.,$v/^  - \[\[.*\//s/\(  - \[\[\)\([a-zA-Z0-9-_ .]\+\)\(.*\)#\(.*\)\]\]/\1\2\3#\4 | \4 (\2)\]\]/'
  execute '.,$v/^  - \[\[.*\//s/\(  - \[\[\)\([a-zA-Z0-9-_ .]\+\)\(.*\)#\(.*\)\]\]/\1\2\3#\4 | \4\]\]/'
  "Move to Generated Tags heading:
  execute 'g/= Generated Tags ='
  "From heading to end of file, on lines containing "/" (thus only for files in subdirectories), re-format the link so that it appears as HEADING (FILE in DIR)
  "(Assumes filename consists only of letters, numbers, dashes, underscores, spaces, dots)
  "execute '.,$g/^  - \[\[.*\//s/\(  - \[\[\)\(.*\)\/\([a-zA-Z0-9-_ .]\+\)\(.*\)#\(.*\)\]\]/\1\2\/\3\4#\5 |\5 (\3 in \2)\]\]/'
  execute '.,$g/^  - \[\[.*\//s/\(  - \[\[\)\(.*\)\/\([a-zA-Z0-9-_ .]\+\)\(.*\)#\(.*\)\]\]/\1\2\/\3\4#\5 |\5\]\]/'
  "Move to Generated Tags heading:
  execute 'g/= Generated Tags ='
  "Replace == tag == with == :tag: ==, mainly for tab-completion, and it also looks nice in html
  execute '.,$s/== \(.*\) ==/== :\1: ==/'
  "Remove all lines that refer to the TAGS file itself:
  "execute '%s/.*TAGS#Generated Tags#.*\n//'
endfunction

" Automatically call MyTags upon writing TAGS.wiki
augroup TAGS
  autocmd!
  autocmd BufWrite *TAGS.wiki  call MyVimwikiGenerateTags()
augroup end

"}}}
"-----------------------------------------
"{{{ DIARY
"-----------------------------------------

nnoremap <leader>w<leader>t :call MyTabMakeDiaryNote()<cr>

function! MyTabMakeDiaryNote()
  execute 'VimwikiTabMakeDiaryNote'
  execute 'tabmove $'
  execute '$'
  call append(line('$'),'%nohtml')
  call append(line('$'),'= untagged =')
  call append(line('$'),':[untagged]: %%+(use dt snippet here)+%%')
  call append(line('$'),'')
  call append(line('$'),'')
  execute '$'
  execute 'startinsert'
endfunction

nnoremap <leader>w<leader>w :call MyMakeDiaryNote()<cr>

function! MyMakeDiaryNote()
  execute 'VimwikiMakeDiaryNote'
  execute '$'
  call append(line('$'),'%nohtml')
  call append(line('$'),'= untagged =')
  call append(line('$'),':[untagged]: %%+(use dt snippet here)+%%')
  call append(line('$'),'')
  call append(line('$'),'')
  execute '$'
  execute 'startinsert'
endfunction

"Generate links in a wiki's diary file upon write:
augroup diary
  autocmd!
  "note that VimwikiDiaryIndex function has 'write' built into it, so this will be executed upon (number)<leader>wi
  autocmd BufWrite *diary.wiki  VimwikiDiaryGenerateLinks
augroup end

function! MyUpdateTags()
  "replace colons with semicolons in tags:
  execute 'vs diary.wiki'
  execute 'write'
  execute 'q'
  execute 'vs TAGS.wiki'
  execute 'write'
  execute 'q'
endfunction

nnoremap <localleader>ut :call UnTag() <cr>
function! UnTag()
  "replace colons with semicolons in tags:
  execute '%s/:\([wtc][#+@-\[]\{-}\)\(\w\{-}\):/;\1\2;/g'
endfunction
nnoremap <localleader>ut :call UnTag() <cr>

command! -nargs=1 ArchiveDiaryEntry call ArchiveDiaryEntry( <q-args> )

nnoremap <localleader>arc :ArchiveDiaryEntry <C-R>%<CR>

" Archiving diary entries (updated 2025-05-20). Assumes it's run from wiki home directory
function! ArchiveDiaryEntry(filename) range
  "append hour, minute, second to filename:
  execute 'Move! ' .  escape( fnamemodify(a:filename, ':r') . strftime("__%H-%M-%S")  . ".wiki", ' ' )
  "get cwd:
  let l:cwd = getcwd()
  "move html file if it exists:
  let l:htmlfile = fnamemodify( a:filename, ':r' ) . ".html"
  if filereadable(l:htmlfile)
    let movehtml = 'mv ' . l:htmlfile . ' .zz-diary/'
    call system(movehtml)
  endif
  "Now move wiki file to ../zz-diary/
  execute 'Move! .zz-diary/'
  sleep 1
  "Navigate back to original directory and open diary.wiki in a split:
  execute 'sp ' . l:cwd . '/diary/diary.wiki'
  sleep 1
  "write the diary (also updates it):
  execute 'w'
  sleep 1
  "buffer containing archived entry will still be open, so move to it and quit it:
  execute 'wincmd k'
  sleep 1
  execute 'q'
endfunction

"-----------------------------------------
"}}} end DIARY
"-----------------------------------------

"-----------------------------------------
"}}} end PLUGIN vimwiki
"-----------------------------------------
"{{{ MY CUSTOM HELP FILES
"-----------------------------------------
autocmd BufNewFile,BufRead *.help.txt set filetype=help foldmethod=marker modifiable noreadonly
autocmd BufWritePost ~/.vim/doc/* :helptags ~/.vim/doc

"JUST IN CASE I NEED TO SET MODIFIABLE:
nnoremap <leader>md :set modifiable<cr>

"USE MY HELP FILES:
nnoremap <leader>hv :help myvim-
nnoremap <leader>hl :$tabe ~/0twc/3computer/latex/latex-mytips.tex<cr>
nnoremap <leader>hb :help mybash-

"EDIT MY HELP FILES:
nnoremap <F4> :call OpenMyVimQuicknotes()<CR>
nnoremap <F5> :call OpenMyLatexQuicknotes()<CR>
nnoremap <F6> :call OpenMyBashQuicknotes()<CR>

function! OpenMyVimQuicknotes()
  execute 'help myvim-quicknotes'
  execute 'set modifiable'
endfunction

function! OpenMyLatexQuicknotes()
  execute 'help mylatex-quicknotes'
  execute 'set modifiable'
endfunction

function! OpenMyBashQuicknotes()
  execute 'help mybash-quicknotes'
  execute 'set modifiable'
endfunction
"-----------------------------------------
"}}} end MY CUSTOM HELP FILES
"-----------------------------------------
"{{{ OPENING MISC FILES (based on :h gf)
"-----------------------------------------

"OPEN FILE IN SAME DIRECTORY AS CURRENT BUFFER:
nnoremap <leader><leader>e :e %:h
nnoremap <leader><leader>s :sp %:h
nnoremap <leader><leader>v :vs %:h
nnoremap <leader><leader>t :$tabe %:h

"OPEN NEW TAB: (takes filename argument)
nnoremap <leader>te :$tabedit 

"TEXDOC FILE UNDER CURSOR: 
noremap <leader>xd :Start! texdoc <cfile><cr>

"OPENING TEXMF LOCAL FILE UNDER CURSOR IN NEW TAB:
noremap <leader>xf :$tabe /Users/preynol1/Library/texmf/tex/local/<cfile>.cls<cr>

"OPENING FILE UNDER CURSOR IN NEW TAB:
noremap <leader>gf :$tabe <cfile><cr>
map gf :$tabe %:h/<cfile><CR>
noremap <leader>go :Open <cfile><cr>

"CHANGES LOCAL DIR TO THAT OF CURRENT BUFFER:
nnoremap <leader>cd :lcd %:p:h <cr> 

" COPY FILENAME WITH PATH TO UNNAMED REGISTER:
nnoremap <leader>cp :let @" = expand("%:p")<CR>

"VIMRC:
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>ev :call OpenVimrc()<CR>

function! OpenVimrc()
  execute '$tabe $MYVIMRC'
  execute 'set foldmethod=marker'
endfunction

"PASSWORD:
nnoremap <leader>ep :$tabe ~/7personal/pwd/pwd.txt<CR>

"ZSH ALIASES:
nnoremap <leader>eza :$tabe /Users/preynol1/.oh-my-zsh/custom/aliases.zsh<CR>

"YAZI KEYMAP:
nnoremap <leader>ek :$tabe /Users/preynol1/.config/yazi/keymap.toml<CR>

"OLDER EXPERIMENTS:
"nnoremap <leader>bc :BeginCenter <CR>
"command! BeginCenter :vnew  | wincmd h | leftabove vnew | wincmd l
"nnoremap <leader>x :CloseCenter <CR>
"command! CloseCenter :wincmd h | bd | wincmd l | bd

"nnoremap <leader>es :vsplit ~/style_www/style.css<CR>
"
"OPENS TODO FILES IN NEW TAB:
nnoremap <leader>tt :call MyTodo()<cr>
command! Td :windo bd

function! MyTodo()
  execute '$tabe ~/Documents/todo/teaching.todo.txt'
  execute 'lcd %:p:h'
  execute 'vs ~/Documents/todo/work.todo.txt'
  execute 'vs ~/Documents/todo/todo.txt'
  execute 'wincmd J'
  execute 'resize -10'
  execute 'wincmd k'
  execute 'TabooRename todo'
endfunction


"-----------------------------------------
"}}} end Opening misc files
"-----------------------------------------
"{{{ My "append to filename" function
"-----------------------------------------
"FUNCTION: Takes argument, appends it to end of filename.
"(Renames file, deletes old one, appropriately sets filetype.)
"USE: vimwiki diary entries that turn out to be important, and merit a descriptive name.

nnoremap <leader>af :MyAppendToFilename 

command! -nargs=1 MyAppendToFilename call MyAppendToFilename( <q-args> )

function! MyAppendToFilename(append) range
  "store filename:
  let l:filename = bufname()
  "store filetype:
  let l:filetype = &filetype
  "store extension:
  let l:extension = '.' . fnamemodify( l:filename, ':e' )
  "I forget why I found this necessary; maybe for files without extenstions?
  if len(l:extension) == 1
    let l:extension = ''
  endif

  execute 'Move! ' .  escape( fnamemodify(l:filename, ':r') . '-' . a:append . l:extension, ' ' )

  "set filetype of moved file appropriately:
  execute 'set ft=' . l:filetype

endfunction

"-----------------------------------------
"}}} end My "append to filename" function
"-----------------------------------------
"{{{ My "Backup with timestamp" function
"-----------------------------------------
"Writes a backup file with timestamp appended to filename. 
"For tex files, check if pdf file exists, and if so, copy that pdf file to a timestamped backup pdf as well.
"Does not open the backed up file.

nnoremap <leader>ts call BackupWithTimestamp()

function! BackupWithTimestamp()
  let l:filename = bufname()
  let l:extension = '.' . fnamemodify( l:filename, ':e' )
  if len(l:extension) == 1
    let l:extension = ''
  endif

  let l:timestampedfilename = escape( fnamemodify(l:filename, ':r') . strftime("-%Y%m%d") . l:extension, ' ' )

  if filereadable(l:timestampedfilename)
    echom "Today's backup already exists. Not proceeding."
  else
    if l:extension == ".tex"
      echom "tex file detected, will check for pdf"
      let l:pdffile = fnamemodify( l:filename, ':r' ) . ".pdf"
      if filereadable(l:pdffile)
        let l:timestampedpdffilename = escape( fnamemodify(l:filename, ':r') .  strftime("-%Y%m%d") . '.pdf', ' ' )
        echom l:pdffile "detected, will be copied to " l:timestampedpdffilename
        let tempcommand = 'cp ' . l:pdffile . ' ' . l:timestampedpdffilename
        call system(tempcommand)
      else
        echom l:pdffile "NOT detected"
      endif
    endif

    execute "write " . l:timestampedfilename

    echom "Backed up " strftime("%Y%m%d")
    "execute "e " . a:filename
  endif
endfunction

"-----------------------------------------
"}}} end My "Backup with timestamp" function
"-----------------------------------------
"{{{ COMPLETTION, DICTIONARY
"-----------------------------------------

set complete=.,w,b,u,t,k "2022-09-28. Removed i option which caused tab completion to scan included files (took ages with some latex files). 2024-10-05 added k option for dictionary (see above for dictionary details

set dictionary+=~/.vim/doc/dictionary.txt " added 2024-10-05

"nnoremap <leader>ed :tabe $HOME/SYSTEM/dictionary.txt <CR>

nnoremap <leader>dd :call AddToDictionary()<cr>

function! AddToDictionary()
  let l:currentword = expand('<cword>')
  call writefile([l:currentword], $HOME . "/.vim/doc/dictionary.txt", "a")
endfunction

"-----------------------------------------
"}}} end COMPLETTION
"-----------------------------------------
"{{{ plugin: NERDTree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nc :NERDTreeCWD<CR>
"}}} end NERDTree 
"-----------------------------------------
"{{{ plugin: vim-cool
let g:cool_total_matches = 1
"}}} end 
"-----------------------------------------
"{{{ functions: add quick note
"-----------------------------------------
"2025-06-11 These functions allow me to write a line of text and append it to
"a particular file of my choosing. Very useful for adding to todo lists, work
"wiki, teaching wiki, computer wiki, without having to navigate away from my
"current buffer. 
"(Remember to delete line afterwards, as it's not relevant to current file!)

"2025-05-28 The following will reload a buffer on BufEnter (useful for my AddTo... functions)
augroup MyReload
  autocmd!
  autocmd BufEnter *todo.txt e
  autocmd BufEnter *twc.wiki e
augroup end

"2025-07-17 Found the following function at https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
function! Get_visual_selection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)
  if len(lines) == 0
    return ''
  endif
  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  "return join(lines, "\n") 
  return lines
endfunction

nnoremap <leader>att :call AddToTodoTeaching()<CR>
function! AddToTodoTeaching()
  let l:line = getline('.')
  call writefile([strftime("%F") . ': ' . l:line], $HOME . "/Documents/todo/teaching.todo.txt", "a")
endfunction

nnoremap <leader>atw :call AddToTodoWork()<CR>
function! AddToTodoWork()
  let l:line = getline('.')
  call writefile([strftime("%F") . ': ' . l:line], $HOME . "/Documents/todo/work.todo.txt", "a")
endfunction

nnoremap <leader>atd :call AddToTodo()<CR>
function! AddToTodo()
  let l:line = getline('.')
  call writefile([strftime("%F") . ': ' . l:line], $HOME . "/Documents/todo/todo.txt", "a")
endfunction

nnoremap <leader>aa :call AddToTWCQuicknotes()<CR>
function! AddToTWCQuicknotes()
  let l:line = getline('.')
  call writefile(['- ' . strftime("%F") . ': ' . l:line], $HOME . "/0twc/twc.wiki", "a")
endfunction

command! -range -nargs=0 AddToLatexMyTips call writefile(Get_visual_selection(), $HOME . "/0twc/3computer/latex/latex-mytips.tex", "a")
"-----------------------------------------
"}}} 
"-----------------------------------------
"{{{ MyKeymaps Functions
"-----------------------------------------
nnoremap <leader>kk :Bufferize call MyKeymaps()<CR>

function! MyKeymaps()
  echo ",kk: Bufferize call MyKeymaps() -- OPEN THESE IN BUFFER "
  echo "{{{ GIT, FUGITIVE "
  echo ",gc: Git commit -m  -- and enter message"
  echo ",gC: Git commit -- enter message AND body"
  echo ",gb: Git branch -- create branch (no spaces)"
  echo ",gb: Git checkout branch"
  echo ",gt: Git tag"
  echo ",gm: Git merge"
  echo "}}}"
  echo "{{{ OPEN/CLOSE/VIEW ETC "
  echo ",,e: e %:h -- open file in same directory as current buffer"
  echo ",,s: sp %:h -- split file in same directory as current buffer"
  echo ",,v: vs %:h -- vsplit file in same directory as current buffer"
  echo ",,t: $tabe %:h -- tab file in same directory as current buffer"
  echo ",te: $tabedit"
  echo ",gf: $tabe <cfile><cr> -- OPENING FILE UNDER CURSOR IN NEW TAB"
  echo ",go: Open <cfile><cr> -- OPEN FILE UNDER CURSOR"
  echo ",xd: Start! texdoc <cfile><cr> -- TEXDOC FILE UNDER CURSOR"
  echo ",xf: $tabe /Users/preynol1/Library/texmf/tex/local/<cfile>.cls<cr> -- OPEN cls FILE"
  echo ",ev: Opens vimrc"
  echo ",sv: Sources vimrc"
  echo ",ep: Opens password file"
  echo ",eza: Opens zsh aliases"
  echo ",ek: Opens yazi keymaps"
  echo ",tt: :call MyTodo() -- open todo files in new last tab"
  echo "}}}"
  echo "{{{ MISC "
  echo ",fw: Fw -- foldsearch, show lines which contain the word under the cursor"
  echo ",gg: Toggle Goyo"
  echo "<F1>: insert current date"
  echo "<F3>: Ultisnips edit (for current filetype)"
  echo "ctrl-W m: maximize window"
  echo ",wo: Wipeout -- Closes all buffers not in windows"
  echo ":Td: delete all buffers in current tab"
  echo ",dt: diffthis"
  echo ",do: diffoff"
  echo ",dd: AddToDictionary -- Writes word under cursor to .vim/doc/dictionary.txt"
  echo "}}}"
  echo "{{{ RENAME & BACKUP FILES "
  echo ",af: MyAppendToFilename -- Takes argument, appends it to end of filename."
  echo ",ts: BackupWithTimestamp -- Writes new file with timestamp appended to filename (also checks for tex/pdf)"
  echo "}}}"
  echo "{{{ SCRIPTS "
  echo ",sy: :Start! sync2onedrive -- For syncing to OneDrive"
  echo "}}}"
  echo "{{{ MY CUSTOM HELP "
  echo ",md: set modifiable"
  echo ",hv: help myvim-"
  echo ",hl: $tabe ~/0twc/3computer/latex/latex-mytips.tex"
  echo ",hb: help mybash-"
  echo "<F4>: call OpenMyVimQuicknotes()"
  echo "<F5>: call OpenMyLatexQuicknotes()"
  echo "<F6>: call OpenMyBashQuicknotes()"
  echo "}}}"
  echo "{{{ MY ADD-TO-OTHER-FILES "
  echo ",att: AddToTodoTeaching"
  echo ",atw: AddToTodoWork"
  echo ",atd: AddToTodo"
  echo ",aa: AddToTWCQuicknotes"
  echo "(no keymap): AddToLatexMyTips -- appends visual selection to latex-mytips.tex"
  echo "}}}"
  echo "{{{ FZF, RG "
  echo ",bb: Buffers"
  echo ",ff: FilesIncludeVCS -- run modified Files in cwd; include .gitignore files so I can open pdfs"
  echo ",fh: FilesIncludeVCS ~ -- run modified Files in $HOME"
  echo ",fz: FilesIncludeHidden --  run modified Files in cwd, include hidden files/dirs"
  echo ",f,t :TextOnlyFiles -- run Files in cwd, but only on text files specified in .config/fd/ign-except-text"
  echo ",f,z :TextOnlyFilesIncludeHidden -- same as TextOnlyFiles but include hidden files/dirs"
  echo ",rg: Rg -- run Rg in cwd (default)"
  echo ",rh: RgHome -- run Rg in $HOME"
  echo ",r,t: RgTextOnly -- run Rg in cwd only on text files specified in .config/fd/ign-except-text"
  echo ",r,d :RgDiary -- run Rg in diary of current wiki"
  echo ",r,z :RgTextOnlyIncludeHidden -- run Rg in cwd, only on specific text files, include hidden files/dirs"
  echo "}}}"
  echo "{{{ VIMWIKI "
  echo ",vc: VimwikiTOC"
  echo ",vt: MyVimwikiTabnewLink() -- new tab at end"
  echo ",vv: VimwikiVSplitLink"
  echo ",vk: VimwikiDiaryNextDay"
  echo ",vj: VimwikiDiaryPrevDay"
  echo ",iw: InitializeWikis"
  echo ",w,t: MyMakeDiaryNote"
  echo ",ut: Untag -- for untagging diary entries"
  echo ",arc: ArchiveDiaryEntry -- perform Untag first"
  echo ",hh: :Start! open %:r.html"
  echo "}}}"
  echo "{{{ MARKDOWN "
  echo "<F9> :Pandoc"
  echo ",pp :PandocPDF -- generates pdf"
  echo ",pd :PandocDocx -- generates docx"
  echo ",ph :PandocHtml -- generates html"
  echo "}}}"
  echo "{{{ TEX "
  echo ",vs: Start! open %:r-solutions.pdf "
  echo ",vm: Start! open %:r-marker.pdf "
  echo ",vi: Start! open %:r-instructor.pdf "
  echo ",vc: Start! open %:r-coverpage.pdf "
  echo ",vp: Start! open %:r-pf.pdf "
  echo ",vh: Start! open %:r.html"
  echo ",LL: CompileLectures"
  echo ",LI: CompileInstructor"
  echo ",LA: CompileAllSolutions"
  echo ",LB: CompileBothMarkerSolutions"
  echo ",LC: CompileCoverMarkerSolutions"
  echo ",LF: CompileCover"
  echo ",LX: CompileXelatex"
  echo ",LE: CompileEscape"
  echo "<F10>: VimtexCompile"
  echo "<F12>: Compile"
  echo "}}}"
  echo "{{{ SESSIONS "
  echo ",oo: Obsession <name> -- track session <name>"
  echo ",os: echo ObsessionStatus()"
  echo ",ss: SessUnloadWipeoutLoad -- unload, wipeout, and load new session"
  echo "}}}"
  echo "{{{ TABOO "
  echo ",tr: TabooRename"
  echo ",tn: new (last) tab"
  echo ",tm: tabm -- e.g. tabm3 will move to 3"
  echo "}}}"
  echo "{{{ NERDTREE "
  echo ",nn: NERDTreeToggle"
  echo ",nc: NERDTreeCWD -- current working directory"
  echo "}}}"
endfunction

"-----------------------------------------
"}}} 
"-----------------------------------------
