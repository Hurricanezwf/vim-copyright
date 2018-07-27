" Author: Naresh (nareshkumargangwar@gmail.com)

function! s:year()
  let year = system('date +"%Y"')[0:3]
  return year
endfunction

function! s:email()
  let email = get(g:, 'copyright_email')
  if empty(email)
    let email = system('git config --get user.email')
    let email = strpart(email, 0, strlen(email) - 1)
  endif
  return email
endfunction

function! s:name()
  let name = get(g:, 'copyright_name')
  if empty(name)
    let name = system('git config --get user.name')
    let name = strpart(name, 0, strlen(name) - 1)
  endif
  return name
endfunction

function! s:company_name()
  return get(g:, 'copyright_company_name',
    \'[set g:copyright_company_name in vimrc]')
endfunction

function! PrintCStyleCopyright()
  call setline(1, '// Copyright: '.s:company_name().' '.s:year())
  call setline(2, '// Author: '.s:name().' ('.s:email().')')
endfunction

function! PrintPythonCopyright()
  call setline(1, '#!/usr/bin/python')
  call setline(2, '')
  call setline(3, '# Copyright: '.s:company_name().' '.s:year())
  call setline(4, '# Author: '.s:name().' ('.s:email().')')
endfunction

function! PrintBashCopyright()
  call setline(1, '#!/bin/bash')
  call setline(2, '')
  call setline(3, '# Copyright: '.s:company_name().' '.s:year())
  call setline(4, '# Author: '.s:name().' ('.s:email().')')
endfunction

augroup copyright
  au!
  au BufNewFile *.{cc,cpp,h,hpp,go} :call PrintCStyleCopyright()
  au BufNewFile *.py :call PrintPythonCopyright()
  au BufNewFile *.sh :call PrintBashCopyright()
augroup END
