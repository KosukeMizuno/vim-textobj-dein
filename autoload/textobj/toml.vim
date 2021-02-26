" =================================================================
" Text objects for toml
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

function s:get_stopline()
  let l:save_pos = getpos('.')
  if !search(s:pat_plugins, 'bc')
    return
  endif
  let l:stopline = line('.')
  call setpos('.', l:save_pos)
  return l:stopline
endfunction

function! textobj#toml#plugins_select_a()  " {{{1

endfunction


function! textobj#toml#plugins_select_i()  " {{{1

endfunction


function! textobj#toml#repo_select_a()  " {{{1

endfunction


function! textobj#toml#hook_select_a()  " {{{1
  let l:stopline = s:get_stopline()

  if !search(s:pat_hook.."'''", 'bc', l:stopline)
    echo "x"
    return
  endif
  let l:start = getpos('.')
  echo l:start

  call search("'''", 'e')
  call search("'''", 'e')
  let l:end = getpos('.')

  return ['V', l:start, l:end]
endfunction


function! textobj#toml#hook_select_i()  " {{{1
  let l:stopline = s:get_stopline()

  " 中身なしの場合
  if search(s:pat_hook.."'''\\n'''", 'bc', l:stopline)
    return
  endif

  " TODO: '''で終わらずにコメント行が始まる場合に対応できてない
  "       現在は ''' の前後にコメントなど入らないと仮定している(linewise)
  if !search(s:pat_hook.."'''", 'bc', l:stopline)
    return
  endif
  normal! j
  let l:start = getpos('.')

  call search("'''", 'c')
  normal! k
  let l:end = getpos('.')

  return ['V', l:start, l:end]
endfunction

