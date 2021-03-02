" =================================================================
" Text objects for dein
"
" Copyright (C) 2021 Kosuke Mizuno
"
" This plugin is licensed MIT: {{{
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to
" deal in the Software without restriction, including without limitation the
" rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
" sell copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
" FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
" IN THE SOFTWARE.
" }}}
" =================================================================

let s:pat_hook = '^\s*hook_\(add\|done_update\|post_source\|post_update\|source\)\s*=\s*'
let s:pat_plugins = '^\s*\[\[plugins\]\]'

function s:get_stopline()  " {{{1
  let l:save_pos = getpos('.')
  if !search(s:pat_plugins, 'bcW')
    return
  endif
  let l:stopline = line('.')
  call setpos('.', l:save_pos)
  return l:stopline
endfunction


function! textobj#dein#paragraph_select_a()  " {{{1
  normal! {j
  let l:start = getpos('.')
  normal! }}{
  let l:end = getpos('.')
  return ['V', l:start, l:end]
endfunction


function! textobj#dein#paragraph_select_i()  " {{{1
  normal! {j
  let l:start = getpos('.')
  normal! }k
  let l:end = getpos('.')
  return ['V', l:start, l:end]
endfunction


function! textobj#dein#plugins_select_a()  " {{{1
  if !search(s:pat_plugins, 'bcW')
    return textobj#dein#paragraph_select_a()
  endif
  let l:start = getpos('.')

  if search(s:pat_plugins, 'W')
    normal! k
  else
    normal! G
  endif
  let l:end = getpos('.')

  return ['V', l:start, l:end]
endfunction


function! textobj#dein#plugins_select_i()  " {{{1
  if !search(s:pat_plugins, 'bcW')
    return textobj#dein#paragraph_select_i()
  endif
  let l:start = getpos('.')

  if search(s:pat_plugins, 'W')
    normal! k
  else
    normal! G
  endif
  call search('^\s*\S', 'bc')
  let l:end = getpos('.')

  return ['V', l:start, l:end]
endfunction


function! textobj#dein#repo_select_i()  " {{{1
  if !search(s:pat_plugins, 'bcW')
    return
  endif

  if search('^\s*repo\s*=\s*".', 'e')
    let l:start = getpos('.')
    call search('."', 'c')
  elseif search('^\s*repo\s*=\s*'.."'.", 'e')
    let l:start = getpos('.')
    call search(".'", 'c')
  else
    return
  endif
  let l:end = getpos('.')

  return ['v', l:start, l:end]
endfunction


function! textobj#dein#hook_select_a()  " {{{1
  let l:stopline = s:get_stopline()
  if !l:stopline
    return
  endif

  if !search(s:pat_hook.."'''", 'bc', l:stopline)
    return
  endif
  let l:start = getpos('.')

  if search("'''", 'e') && search("'''", 'e')
    let l:end = getpos('.')
    return ['V', l:start, l:end]
  else
    return
  endif
endfunction


