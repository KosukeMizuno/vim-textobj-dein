# vim-textobj-dein

Note: this plugin is under construction.

Text objects for toml file for [dein.vim](https://github.com/Shougo/dein.vim).

## Requirements

- [vim-textobj-user](https://github.com/kana/vim-textobj-user)

## usage

| Keymap | target                    |
| ------ | ------------------------- |
| aP     | single plugin config      |
| iP     | single plugin config      |
| ir     | repository name           |
| ah     | hook script with closures |

- `iP` and `aP` selects plugin config between from a `[[plugins]]` to the next `[[plugins]]`.
- It selects beyond blank lines in a `hook_*` block.

```
[[plugins]]                              ------
repo = 'KosukeMizuno/vim-textobj-dein'     |  |
lazy = 1                                   |  |
on_ft = 'toml'                             |  |
hook_add = '''                ---          |  |
" If blank line exist,          |          |  |
                                |          |  |
" it will be ignored.         ah|        iP|  |
'''                           ---        ---  |
                                            aP|
                                         ------
[[plugins]]
repo = 'hoge/hoge'
```

This plugins doesn't provide `ih` map for hook-script without closures.  
It can be available by `<Plug>(textobj-precious-i)` in [osyo-manga/vim-precious](https://github.com/osyo-manga/vim-precious).

## tips

Following keymap is useful ([tyru/open-browser.vim](https://github.com/tyru/open-browser.vim) is required.)

```
augroup mytomlrc
  autocmd!
  autocmd Filetype toml nmap <buffer> gx "zyir:<C-u>OpenBrowserSearch <C-r>z<CR>
augroup ENd
```

## License

This plugin is licensed MIT, see [LICENSE](LICENSE).

