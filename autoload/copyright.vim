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

function! copyright#cstyle()
  call setline(1, '// Copyright '.s:year().' 's:name()')
  call setline(2, '//')
  call setline(3, '// Licensed under the Apache License, Version 2.0 (the "License");')
  call setline(4, '// you may not use this file except in compliance with the License.')
  call setline(5, '// You may obtain a copy of the License at')
  call setline(6, '//')
  call setline(7, '//      https://www.apache.org/licenses/LICENSE-2.0')
  call setline(8, '//')
  call setline(9, '// Unless required by applicable law or agreed to in writing, software')
  call setline(10, '// distributed under the License is distributed on an "AS IS" BASIS,')
  call setline(11, '// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.')
  call setline(12, '// See the License for the specific language governing permissions and')
  call setline(13, '// limitations under the License.')
endfunction

function! copyright#python()
  call setline(1, '#!/usr/bin/python')
  call setline(2, '')
  call setline(3, '# Copyright: '.s:company_name().' '.s:year())
  call setline(4, '# Author: '.s:name().' ('.s:email().')')
endfunction

function! copyright#bash()
  call setline(1, '#!/bin/bash')
  call setline(2, '')
  call setline(3, '# Copyright: '.s:company_name().' '.s:year())
  call setline(4, '# Author: '.s:name().' ('.s:email().')')
endfunction
