" function! Expander()
"   let line   = getline(".")
"   let col    = col(".")
"   let first  = line[col-2]
"   let second = line[col-1]
"   let third  = line[col]

"   if first ==# ">"
"     if second ==# "<" && third ==# "/"
"       return "\<CR>\<C-o>==\<C-o>O"

"     else
"       return "\<CR>"

"     endif

"   else
"     return "\<CR>"

"   endif

" endfunction

" inoremap <expr> <leader><CR> Expander()
function EnterOrIndentTag()
  let line = getline(".")
  let col = getpos(".")[2]
  let before = line[col-2]
  let after = line[col-1]

  if before == ">" && after == "<"
    return "\<Enter>\<C-o>O\<Tab>"
  endif
   return ">"
endfunction

inoremap <buffer> <expr> > EnterOrIndentTag()

