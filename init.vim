"                                   
"  _ __   ___  _____   __ __ ___  
" | '_ \ / _ \/ _ \ \ / / | '_ ` _ \ 
" | | | |  __/ (_) \ V /| | | | | | |
" |_| |_|\___|\___/ \_/ |_|_| |_| |_|
"                                    
" 
set nu
set cursorline 
set incsearch
set hlsearch
set wildmenu
set relativenumber
set mouse=a
set smartindent
syntax on

set autoindent
set tabstop=4

let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0


filetype indent on
filetype plugin indent on


nnoremap bp :bp<ESC>	
"back to past file

nnoremap bn :bn<ESC>	
"go to next file

nnoremap mk <C-w>h
nnoremap MK	<C-w>h<C-w>h
nnoremap ml <C-w>l
nnoremap ML	<C-w>l<C-w>l

"回到行首
nnoremap <C-i> 0

"回到行尾
nnoremap ; $
vnoremap ; $


"可视化模式下粘贴部分文本
"neovim没有与系统剪贴板交互的功能，可下载一个软件
"如sudo pacman -S xsel,然后重启neovim

vnoremap <C-c>	"+y
"复制内容

vnoremap <C-v>	"+p
"粘贴内容

nnoremap d; d$
nnoremap ,; :vertical resize-5<ESC>
nnoremap ,l :vertical resize+5<ESC>
nnoremap cc :source $MYVIMRC<ESC>

"跳转到前一个标签页
nnoremap gh gt
"跳转到下一个标签页
nnoremap gf gT


nnoremap i k
nnoremap k j
nnoremap j h


nnoremap MP :MarkdownPreview<ESC>

"打开新的标签页
nnoremap tn :tabnew 
"关闭标签页
nnoremap tq :tabc<ESC>


nnoremap W :w<ESC>
nnoremap Q :wq<ESC>

"分割窗口
nnoremap sp :vsp<ESC><C-w>l 

"z--->i
nnoremap z i

"一键编译运行文件
nnoremap <F5> :call CompileRunGcc() <ESC>
func! CompileRunGcc()
		exec "w"
		if &filetype == 'c'
				exec '!gcc % -o %<'
				exec '! ./%<'
		elseif &filetye == 'cpp'
				exec '!g++ % -o %<'
				exec '! ./%<'
		endif
endfunc



"<F4>打开Tagbar
nnoremap <F4> :TagbarToggle<ESC>	


"打开浮动终端
nnoremap nn :FloatermNew<ESC>



inoremap ;; <ESC>
vnoremap ;; <ESC> 

"可视化下i写入文件
vnoremap w> :w >> 
vnoremap w; :w 


vnoremap i k
vnoremap k j
vnoremap j h

call plug#begin('~/.vim/plugged')
"Plug 'ycm-core/YouCompleteMe'		"vim下代码补全插件
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }	"fzf for nvim/vim
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/vim-gruvbox8'		"vim主题
Plug 'vim-airline/vim-airline'		"底部状态栏
Plug 'iamcco/markdown-preview.vim'	"markdown预览插件
Plug 'preservim/nerdtree'			"文件树显示
Plug 'voldikss/vim-floaterm'		"浮动终端
Plug 'majutsushi/tagbar'			"显示文件函数信息
Plug 'junegunn/goyo.vim'			"vim沉浸式体验
Plug 'itchyny/calendar.vim'			"显示时间,日历
Plug 'neoclide/coc.nvim', {'branch': 'release'}	"neovim下代码补全插件
Plug 'vim-airline/vim-airline-themes'	"底部状态栏主题
call plug#end()

colorscheme  gruvbox8

let g:airline_theme='alduin'
let g:goyo_width=90
let g:vimspector_enable_mappings = 'HUMAN'


autocmd FileType json syntax match Comment +\/\/.\+$+

" Use Ctrl+n for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <C-l>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')


