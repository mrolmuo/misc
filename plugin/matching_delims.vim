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

func s:type_or_indent(delimiters)
    let c = strpart(getline('.'), col('.')-1, 1)
    for d in a:delimiters
        if c == d
            return "\<del>\<cr>".d."\<esc>ko"
        endif
    endfor
    return "\<cr>"
endfunc

func s:delete_matching_delimiters(delimiters)
    let a = strpart(getline('.'), col('.')-2, 1)
    let b = strpart(getline('.'), col('.')-1, 1)
    for [l, r] in a:delimiters
        if a == l && b == r
            return "\<bs>\<del>"
        endif
    endfor
    return "\<bs>"
endfunc

call s:create_matching_delimiters("{", "}")
call s:create_matching_delimiters("(", ")")
call s:create_matching_delimiters("[", "]")
call s:create_matching_delimiters("'", "'")
call s:create_matching_delimiters("\"", "\"")

inoremap  <expr>  <cr>  <sid>type_or_indent(["}", "]", ")"])

call s:delete_matching_delimiters([["a", "b"], ["c", "d"]])

inoremap  <expr>  <bs>  <sid>delete_matching_delimiters([["{", "}"], ["[", "]"], ["(", ")"], ["'", "'"], ["\"", "\""]])
