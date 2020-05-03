" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" plug easymotion
Plug 'easymotion/vim-easymotion'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Git gutter
Plug 'airblade/vim-gitgutter'

" gof for open current file in file manager
Plug 'justinmk/vim-gtfo'

" better incremental search
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" send lines to interpreter
Plug 'jalvesaq/vimcmdline'

" modeline 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/limelight.vim' " Highlights only active paragraph

" Used to do latex
Plug 'lervag/vimtex'

" Expand registers
Plug 'junegunn/vim-peekaboo'

" Color matching parens
Plug 'junegunn/rainbow_parentheses.vim'

" Used to do snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" file navi
Plug 'preservim/nerdtree'

" colors
Plug 'sjl/badwolf'
Plug 'ayu-theme/ayu-vim'
Plug 'reedes/vim-colors-pencil'
Plug 'lifepillar/vim-solarized8'
Plug 'pbrisbin/vim-colors-off' " no colors
Plug 'pgdouyon/vim-yin-yang' " no colors
Plug 'huyvohcmc/atlas.vim' " no colors
Plug 'KKPMW/distilled-vim' " little colors
Plug 'chriskempson/base16-vim'

" swissknife for vim and R communication
Plug 'jalvesaq/Nvim-R'

" for citation using citation.vim
Plug 'Shougo/unite.vim' 

"snippet framework beginning

"snippets framework end
Plug 'chrisbra/csv.vim' "for viewing data directly in vim R (Nvim-R)
Plug 'junegunn/goyo.vim' 

" Plug fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" ###### CONFIGS
filetype plugin indent on

" ####### NVIM-R ########
" press -- to have Nvim-R insert the assignment operator: <-
let R_assign_map = "--"

" set minimum source editor width
let R_min_editor_width = 80

" make sure the console is at the bottom by making it really wide
let R_rconsole_width = 100

" show arguments for functions during omnicompletion
let R_show_args = 1

" Don't expand a dataframe to show columns by default
let R_objbr_opendf = 0

" Indent code by pressing ctrl-i
" nmap <C-i> <Plug>RIndent
" vmap <C-i> <Plug>RIndent
"
" Toggle Comment
" nmap <C-S-c> <Plug>RToggleComment
" vmap <C-S-c> <Plug>RToggleComment

" remapping the basic :: send line
nmap , <Plug>RDSendLine
" remapping selection :: send multiple lines
vmap , <Plug>RDSendSelection
" remapping selection :: send multiple lines + echo lines
vmap ,e <Plug>RESendSelection

"fix indentation
let r_indent_align_args = 0
let r_indent_ess_comments = 0
" let r_indent_ess_compatible = 0

" ######## TRICKS #######
let maplocalleader="\<Space>"
let mapleader="\<Space>"

" Set a unite leader:
nmap <leader>u [unite]
nnoremap [unite] <nop>

" Set open Nerd Tree
map <C-n> :NERDTreeToggle<CR>

" ######## SET EASY MOTION
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Setup better incremental search w. incsearch
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" make it like easymotion
map / <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

" move lines 
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)


" setup vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

"" Setup snippets - se documentation for hvordan setuppet laves
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Set up spell check and correction using ctrl_L
" setlocal spell
" set spelllang=en_gb
" inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" break habit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" remap :FZF to ctrl-P 
nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <leader>b :Buffers<CR>

" remap vimcmdline mappings
let cmdline_map_start          = '<LocalLeader>s'
let cmdline_map_send           = '<Space>,'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>p'
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>q'
let cmdline_map_start          = '<Space>s'
let cmdline_map_send           = '<Space>'

" colors
set termguicolors
set t_Co=256   " This is may or may not needed.
let ayucolor="dark"   " for dark version of theme
" set background=light
colorscheme base16-default-dark
set nu

function! s:goyo_enter()
    colorscheme pencil
endfunction

function! s:goyo_leave()
    colorscheme base16-default-dark
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
