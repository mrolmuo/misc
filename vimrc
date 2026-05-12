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

inoremap jk <Esc>
" inoremap {<CR> {<CR>}<Esc>ko
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

inoremap { {}<Left>
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> <CR> strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Del>\<CR>}\<Esc>ko" : "\<CR>"
vnoremap { <Esc>`<i{<Esc>`>a<right>}<Esc>

inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
vnoremap ( <Esc>`<i(<Esc>`>a<right>)<Esc>

inoremap [ []<Left>
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
vnoremap [ <Esc>`<i[<Esc>`>a<right>]<Esc>

inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
vnoremap ' <Esc>`<i'<Esc>`>a<right>'<Esc>

inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
vnoremap " <Esc>`<i"<Esc>`>a<right>"<Esc>
