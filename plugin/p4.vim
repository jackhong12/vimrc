
function! P4Reopen()
    let file_name = expand('%:p')
    silent! execute "! p4 open " . l:file_name
    e
    redraw! " redraw window
endfunction
