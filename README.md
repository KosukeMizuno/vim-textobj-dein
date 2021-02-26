# vim-textobj-dein

Text objects for toml file for [dein.vim](https://github.com/Shougo/dein.vim).

## Requirements

- [vim-textobj-user](https://github.com/kana/vim-textobj-user)

## usage

| Keymap | target                    |
| ------ | ------------------------- |
| ap     | single plugin config      |
| ip     | single plugin config      |
| ir     | repository name           |
| ah     | hook script with closures |

If you prefer `ap` and `ip` as the vim's default (textobject for paragraph),
`let g:textobj_dein_no_default_key_mapings_plugins = 1`.

This plugins doesn't provide `ih` map for hook-script without closures.
It can be available by `<Plug>(textobj-precious-i)` in [vim-precious](https://github.com/osyo-manga/vim-precious).

## tips

Following keymap is useful ([tyru/open-browser.vim](https://github.com/tyru/open-browser.vim) is required.)
```
nmap <buffer> gx "zyir:<C-u>OpenBrowserSearch <C-r>z<CR>
```

## License

This plugin is licensed MIT, see [LICENSE](LICENSE).

