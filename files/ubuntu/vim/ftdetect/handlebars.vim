" Language:    Handlebars

autocmd BufNewFile,BufRead *.handlebars set filetype=handlebars
autocmd BufNewFile,BufRead *.hb set filetype=handlebars

function! s:DetectHandlebars()
    if getline(1) =~ '^\<script.*test\/x-handlebars'
        set filetype=handlebars
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectHandlebars()
