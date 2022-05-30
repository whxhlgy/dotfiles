let mapleader = " " " map leader to Space
" ========================================================================================================
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" 外观相关 {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'sainnhe/sonokai'
" }}} 外观相关

" {{{ 语法高亮
Plug 'vim-python/python-syntax'
let g:python_highlight_all = 1
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_member_variable_highlight = 1
" }}}

" 补全 {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ervandew/supertab'
" Plug 'ycm-core/YouCompleteMe'
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_auto_hover = ''
" let g:ycm_show_diagnostics_ui = 0 " 已经有ale，不需要
" nmap <leader>fw <Plug>(YCMFindSymbolInWorkspace)
" " <c-c> close
" nmap <leader>fd <Plug>(YCMFindSymbolInDocument)
" nnoremap <leader>gt :YcmCompleter GoTo<CR>
" nmap <leader>d <plug>(YCMHover)
" " make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'
" }}} 补全

" 语法提示 {{{
" Plug 'dense-analysis/ale'
" let g:ale_linters = {
" \   'asm': [''],
" \   'tex': [''],
" \   'python': [''],
" \}
" }}} 语法提示

" 自动括号 {{{
" Plug 'LunarWatcher/auto-pairs'
" let g:AutoPairsCompleteOnlyOnSpace = 1
" autocmd FileType html let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
" "" tag
" Plug 'alvan/vim-closetag'
" let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
" let g:closetag_filetypes = 'html,xhtml,phtml'
" let g:closetag_xhtml_filetypes = 'xhtml,jsx'
" let g:closetag_emptyTags_caseSensitive = 1
" let g:closetag_regions = {
"     \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"     \ 'javascript.jsx': 'jsxRegion',
"     \ 'typescriptreact': 'jsxRegion,tsxRegion',
"     \ 'javascriptreact': 'jsxRegion',
"     \ }
" let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = '<leader>>'
" }}} 自动括号
"
Plug 'honza/vim-snippets'

" 修改括号、添加括号等
Plug 'tpope/vim-surround'

Plug 'preservim/nerdtree'
nnoremap <leader>n :NERDTreeToggle<CR>
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


Plug 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer = 0

" 用于对齐 :help tabular
Plug 'godlygeek/tabular'

" Plug 'SirVer/ultisnips'
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<c-j>"
" let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
" let g:UltiSnipsSnippetDirectories=["/Users/zhongjunjie/.vim/UltiSnips"]
" let g:UltiSnipsEditSplit="vertical"

" 增加注释
Plug 'tpope/vim-commentary'
" autocmd FileType c setlocal commentstring=#\ %s

" latex
Plug 'lervag/vimtex'

" fold method
Plug 'Konfekt/FastFold'

" Initialize plugin system
call plug#end()
" ========================================================================================================
" 保证插件可用
set nocompatible
filetype plugin on

" coc.nvim {{{
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" <CR> don't auto select first item
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

autocmd FileType json syntax match Comment +\/\/.\+$+
" }}} coc.nvim

" coc-snippets {{{
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" " Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
" imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'

" Use <leader>sn to edit snippets
nnoremap <leader>sn :CocCommand snippets.editSnippets<CR>
" }}} coc-snippets

" vimtex {{{
let g:vimtex_view_method = 'skim'
" never open the quickfix open when on erros
let g:vimtex_quickfix_open_on_warning = 0
" conceal 
set conceallevel=1
let g:tex_conceal='abdmg'
" let maplocalleader = ","
" let g:tex_flavor = 'latex'
" }}} vimtex

" sonokai {{{
 " Important!!
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_transparent_background = 0
let g:sonokai_diagnostic_virtual_text = 'colored'

function! s:sonokai_custom() abort
  " Link a highlight group to a predefined highlight group.
  " See `colors/sonokai.vim` for all predefined highlight groups.
  " highlight! link groupA groupB
  " highlight! link groupC groupD

  " Initialize the color palette.
  " The parameter is a valid value for `g:sonokai_style`,
  let l:palette = sonokai#get_palette('andromeda')
  " Define a highlight group.
  " The first parameter is the name of a highlight group,
  " the second parameter is the foreground color,
  " the third parameter is the background color,
  " the fourth parameter is for UI highlighting which is optional,
  " and the last parameter is for `guisp` which is also optional.
  " See `autoload/sonokai.vim` for the format of `l:palette`.
  call sonokai#highlight('Visual', l:palette.none, l:palette.grey)
  call sonokai#highlight('Conceal', l:palette.orange, l:palette.none)
endfunction

augroup SonokaiCustom
  autocmd!
  autocmd ColorScheme sonokai call s:sonokai_custom()
augroup END
colorscheme sonokai
" }}} sonokai

" vim-airline {{{
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'sonokai'
let g:airline_theme = 'sonokai'
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_theme = 'sonokai'
" }}} vim-airline

" Turn on syntax highlighting.
syntax on
filetype on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a


" Tab operation
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
noremap <leader>t :tabnew<cr>
" noremap <leader>k :tabnext<cr>
" Indent & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
" for html, javascript, css
autocmd FileType html,javascript,css setlocal tabstop=2
autocmd FileType html,javascript,css setlocal softtabstop=2
autocmd FileType html,javascript,css setlocal shiftwidth=2

set cindent 
" set smartindent
set autoindent
" html 
filetype indent on
let g:html_indent_script1 = "auto"
let g:html_indent_style1 = "auto"
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs
"
"  {{{ 自动括号
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
" }}} 
" 命令行模式自动补全
set wildmode=list:longest,full

" 从系统剪切板中复制粘贴
vnoremap <Leader>y "*y 
nnoremap <Leader>p "*p

" 搜索相关
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch
set nohlsearch

" 屏幕滚动与跳转
set scrolloff=6
" set scroll=10
" noremap <C-D> 10j
" noremap <C-U> 10k
noremap <C-E> 2<C-E>
noremap <C-Y> 2<C-Y>

" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>

" Quickly resource vim.rc
" nnoremap <Leader>r :so ~/.vimrc<CR>
nnoremap <Leader>e :tabnew ~/.vimrc<CR>

" open current file location
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'

" run current file {{{
autocmd FileType cpp nnoremap <buffer> <Leader>r :!g++-11 -g % -o %< && ./%<<CR>
" }}}



" set comment color
highlight Comment ctermfg=Blue

" 设置折叠 {{{
set foldmethod=marker
" open fold automatically
" set foldclose=all " Close folds if you leave them in any way
" set foldcolumn=0 " Show the foldcolumn
" set foldenable " Turn on folding
" set foldlevel=0 " Autofold everything by default
" " set foldmethod=syntax " Fold on the syntax
" set foldnestmax=1 " I only like to fold outer functions
" set foldopen=all " Open folds if you touch them in any way

" " vimtex fold
" set foldmethod=expr
" set foldexpr=vimtex#fold#level(v:lnum)
" set foldtext=vimtex#fold#text()

" only close outer fold
set foldnestmax=1
nmap zuz <Plug>(FastFoldUpdate)
let g:fastfold_savehook = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:vimsyn_folding = 'af'
autocmd FileType c,cpp setlocal foldmethod=syntax
autocmd FileType python setlocal foldmethod=indent
" }}}
" 
set guifont=SauceCodePro\ Nerd\ Font\ Mono:h13
set noshowmode
" {{{ neovide 
let g:neovide_transparency=1
let g:neovide_remember_window_size = v:true
" let g:neovide_fullscreen=v:true
" }}}
