function! CopyrightYear()
  let year = system('date +"%Y"')[0:3]
  return year
endfunction

function! CopyrightEmail()
  let email = get(g:, 'copyright_email')
  if empty(email)
    let email = system('git config --get user.email')
    let email = strpart(email, 0, strlen(email) - 1)
  endif
  return email
endfunction

function! CopyrightName()
  let name = get(g:, 'copyright_name')
  if empty(name)
    let name = system('git config --get user.name')
    let name = strpart(name, 0, strlen(name) - 1)
  endif
  return name
endfunction

function! CopyrightCompanyName()
  return get(g:, 'copyright_company_name',
    \'[set g:copyright_company_name in vimrc]')
endfunction

function! PrintCStyleCopyright()
  call setline(1, '// Copyright: '.CopyrightCompanyName().' '.CopyrightYear())
  call setline(2, '// Author: '.CopyrightName().' ('.CopyrightEmail().')')
endfunction

function! PrintPythonCopyright()
  call setline(1, '#!/usr/bin/python')
  call setline(2, '')
  call setline(3, '# Copyright: '.CopyrightCompanyName().' '.CopyrightYear())
  call setline(4, '# Author: '.CopyrightName().' ('.CopyrightEmail().')')
endfunction

function! PrintBashCopyright()
  call setline(1, '#!/bin/bash')
  call setline(2, '')
  call setline(3, '# Copyright: '.CopyrightCompanyName().' '.CopyrightYear())
  call setline(4, '# Author: '.CopyrightName().' ('.CopyrightEmail().')')
endfunction

augroup copyright
  au!
  au BufNewFile *.{cc,cpp,h,hpp,go} :call PrintCStyleCopyright()
  au BufNewFile *.py :call PrintPythonCopyright()
  au BufNewFile *.sh :call PrintBashCopyright()
augroup END
