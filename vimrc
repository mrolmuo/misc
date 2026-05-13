set background=dark
set termguicolors
color gruberdarker

set number
set relativenumber

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set mouse=a
set autoindent
set smartindent

set wildmenu

let g:tex_no_error=1

inoremap jk <Esc>
nnoremap <C-s> :w<CR>

nnoremap <Space>m :make<CR>
nnoremap <Space>l :copen<CR>
nnoremap <Space>x :bdelete<CR>
nnoremap <Space>e :e 
nnoremap <Space>b :b 
nnoremap m :cnext<CR>
nnoremap M :cprev<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprev<CR>
