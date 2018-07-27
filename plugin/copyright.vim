" Author: Naresh (nareshkumargangwar@gmail.com)

augroup copyright
  au!
  au BufNewFile *.{cc,cpp,h,hpp,go} :call copyright#cstyle()
  au BufNewFile *.py :call copyright#python()
  au BufNewFile *.sh :call copyright#bash()
augroup END
