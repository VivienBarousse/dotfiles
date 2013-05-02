syntax on

set autoindent

set expandtab
set shiftwidth=2
set softtabstop=2

set wildmode=longest,list " bash-style completion

set runtimepath^=~/.vim/bundle/ctrlp.vim

func! MyCtrlP()
  if expand("%") == ""
    let g:ctrlp_prompt_mappings= {
        \ 'AcceptSelection("e")': ['<cr>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ }
  else
    let g:ctrlp_prompt_mappings= {
        \ 'AcceptSelection("t")': ['<cr>'],
        \ 'AcceptSelection("e")': ['<c-e>'],
        \ }
  endif
  CtrlP
endfunc

com! MyCtrlP call MyCtrlP()

filetype on
au BufNewFile,BufRead *.go set filetype=go

autocmd VimEnter * nmap <c-p> :MyCtrlP<cr>
