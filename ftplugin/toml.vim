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

if exists('g:textobj_dein_no_default_key_mappings') && g:textobj_dein_no_default_key_mappings
  finish
endif

omap <buffer> ap <Plug>(textobj-dein-plugins-a)
xmap <buffer> ap <Plug>(textobj-dein-plugins-a)
omap <buffer> ip <Plug>(textobj-dein-plugins-i)
xmap <buffer> ip <Plug>(textobj-dein-plugins-i)
omap <buffer> ir <Plug>(textobj-dein-repo-i)
xmap <buffer> ir <Plug>(textobj-dein-repo-i)
omap <buffer> ah <Plug>(textobj-dein-hook-a)
xmap <buffer> ah <Plug>(textobj-dein-hook-a)

