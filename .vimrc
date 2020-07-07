"
"                         _                    
" _ __ ___  _   _  __   _(_)_ __ ___  _ __ ___ 
"| '_ ` _ \| | | | \ \ / / | '_ ` _ \| '__/ __|
"| | | | | | |_| |  \ V /| | | | | | | | | (__ 
"|_| |_| |_|\__, |   \_/ |_|_| |_| |_|_|  \___|
"------------------------- normal setting zone ------------------------------
set norelativenumber   "设置行号固定"
set number
set guifont=Monaco:h18  "字体大小"                                                                                            
set tabstop=4   "tab 标准格式"
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1 "解决特殊文字编码问题"
set enc=utf8    "解决中文乱码"
set cursorline      "突出显示当前行" 
syntax on

set showcmd "show command below the window"
set wrap    "text dont out of the window"   
set wildmenu    " search quickly "
set hlsearch    "hilghtline search result"
set incsearch   "search hightline"
set ignorecase  "ignore case search"
set smartcase   "smart case for search"

"---------------------------- remap your keyboard ----------------------------
"set the quick up and down keyboard"
noremap Q 10k "向上10行"
noremap W 10j   "向下10行"
map s <nop>	"不要删除当前字符进入写入mOde
map S :w<CR>	"保存当前文档修改

"split your terminal "
let mapleader = "\<space>"	"前缀键leader修改为空格"
map sl :set splitright<CR>:vsplit<CR>	“往右分屏”
map sh :set nosplitright<CR>:vsplit<CR>	“往左分屏”
map sk :set nosplitbelow<CR>:split<CR>	“网上分屏”
map sj :set splitbelow<CR>:split<CR> "往下分屏"
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map L :vertical resize-15<CR>	"当前分屏往右扩大"  
map H :vertical resize+15<CR>	“当前分屏往左扩大”
map K :res +10<CR>	"当前分屏向上扩大
map J :res -10<CR>	"当前分屏向下扩大
map sr <C-w>t<C-w>H	"切换成左右分屏"
map sv <C-w>t<C-w>K	“切换成上下分屏”

map tn :tabe<CR>	"标签页创建和切换"
map th :-tabnext<CR>
map tl :+tabnext<CR>

"print super big title
map tx :r !figlet
"-------------------------- terminal configuration zone ----------------------------
set nocompatible	"can not compatible for other version."
filetype indent on 
filetype plugin on
filetype plugin indent on

let &t_ut=''	"terminal color is stable when you checkout to other system."
set tabstop=4		"tabe width == 4 for python programming."
"set list	"show code line  block space
set laststatus=2	"number of terminal status lines
set scrolloff=5		"show the number of lines up or below current cursor

"-------------------------- spelling zone ---------------------------------
"spell check spell
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
"select a specific currect spell
inoremap <C-x> <Esc>ea<C-x>s
"go back to the  place which you edited last time.

"edit your placeholder which is <+> while you are coding
map <LEADER><LEADER> <Esc>/<+><CR>:nohlsearch<CR>c3l

"anchor the line which you edited last time.
au BufReadPost * if line("'\"") >1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif		"cursor back to the line."

"this
"-------------------------install your vim plug------------------------------
call plug#begin('~/.vim/plugged')

"show status bar below
Plug 'vim-airline/vim-airline'	

"change terminal color
Plug 'connorholyday/vim-snazzy'

"file nevigation."
Plug 'scrooloose/nerdtree',{'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'

"python editor
Plug 'vim-scripts/indentpython.vim'

"code complete
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

"asyc check error when you coding

"ale : check your code error 
Plug 'w0rp/ale'

call plug#end()

"change terminal color
colorscheme snazzy 

"NERD Tree configuration
map tt :NERDTreeToggle<CR>

"python indent configuration
set backspace=indent,eol,start
"let g:python_highlight_all=1

"Ale configuration
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8','yapf']

