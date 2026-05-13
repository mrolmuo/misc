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

func s:if_at_cursor(p, a, b)
    let p = escape(a:p ,"\"")
    let a = escape(a:a ,"\"")
    let b = escape(a:b ,"\"")
    return "strpart(getline('.'), col('.')-1, 1) == \"".p."\" ? \"".a."\" : \"".b."\""
endfunc

func s:create_matching_delimiters(l, r)
    if a:l == a:r
        execute  "inoremap"  "<expr>"  a:r  s:if_at_cursor(a:r, "<right>", a:r.a:r."<left>")
    else
        execute  "inoremap"  a:l  a:l.a:r."<left>"
        execute  "inoremap"  "<expr>"  a:r  s:if_at_cursor(a:r, "<right>", a:r)
    endif
    execute  "vnoremap"  a:l  "<Esc>`<i".a:l."<Esc>`>a<right>".a:r."<Esc>"
endfunc

call s:create_matching_delimiters("{", "}")
call s:create_matching_delimiters("(", ")")
call s:create_matching_delimiters("[", "]")
call s:create_matching_delimiters("'", "'")
call s:create_matching_delimiters("\"", "\"")

func s:type_or_indent(delimiters)
    let c = strpart(getline('.'), col('.')-1, 1)
    for d in a:delimiters
        if c == d
            return "\<del>\<cr>".d."\<esc>ko"
        endif
    endfor
    return "\<cr>"
endfunc

inoremap <expr> <cr> <sid>type_or_indent(["}", "]", ")"])
