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

func! ABSCLA19071348()
  silent :%s/$/ Tom/g
endfunc

com! MyCtrlP call MyCtrlP()
com! ABSCLA19071348 call ABSCLA19071348()

let g:ctrlp_custom_ignore = 'node_modules'

filetype on

au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.json set filetype=javascript
au BufNewFile,BufRead *.str set filetype=ruby
au BufNewFile,BufRead Capfile set filetype=ruby
au BufNewFile,BufRead Gemfile set filetype=ruby

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType make setlocal noexpandtab shiftwidth=0 softtabstop=0

autocmd VimEnter * nmap <c-p> :MyCtrlP<cr>

