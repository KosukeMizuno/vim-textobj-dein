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

if exists('g:loaded_textobj_toml_plugin')
  finish
endif

" if exists('g:textobj_toml_no_default_key_mappings')
"   s:no_default_map = g:textobj_toml_no_default_key_mappings
"   g:textobj_toml_no_default_key_mappings = 0
" endif

" TODO: ftplugin のこと考えてなかった

call textobj#user#plugin('toml', {
    \ 'plugins' : {
    \      'select-a' : 'ap', 'select-a-function' : 'textobj#toml#plugins_select_a',
    \      'select-i' : 'ip', 'select-i-function' : 'textobj#toml#plugins_select_i',
    \   },
    \ 'repo' : {
    \      'select-i' : 'ir', 'select-i-function' : 'textobj#toml#repo_select_i',
    \   },
    \ 'hook' : {
    \      'select-a' : 'aH', 'select-a-function' : 'textobj#toml#hook_select_a',
    \      'select-i' : 'iH', 'select-i-function' : 'textobj#toml#hook_select_i',
    \   },
    \})

" if exists('s:no_default_map')
"   g:textobj_toml_no_default_key_mappings = s:no_default_map
" endif

let g:loaded_textobj_toml_plugin = 1
