<p align="center">
  <h1 align="center">key-analyzer.nvim</h2>
</p>

<p align="center">
        Ever wondered which mappings are free to be mapped? Now it's a easier to figure it out.
</p>

<p align="center">
    <img width="270" align="center" src="https://otivdev.ams3.cdn.digitaloceanspaces.com/api-automatic-uploads/prod/SameSize/screenshot_2024_11_03_at_02_06_20_mobile.png" />
</p>

## ⚡️ Features

- 🎹 Visual QWERTY keyboard layout showing your mapped and unmapped keys
- 🔍 Analyze mappings for any prefix in any mode (normal, insert, visual, etc.)
- 💡 Interactive hover tooltips showing the mapping details

## 📋 Installation

<div align="center">
<table>
<thead>
<tr>
<th>Package manager</th>
<th>Snippet</th>
</tr>
</thead>
<tbody>

<tr>
<td>

[folke/lazy.nvim](https://github.com/folke/lazy.nvim)

</td>
<td>

```lua
require("lazy").setup({
    { "meznaric/key-analyzer.nvim", opts = {} },
})
```

</td>
</tr>
</tbody>
</table>
</div>

## Usage

|   Command   |         Description        |
|-------------|----------------------------|
| `:KeyAnalyzer <prefix> [mode]` | Shows keyboard analysis for the given prefix and mode. Mode defaults to normal ('n') if not specified. |
| `:KeyAnalyzer <leader>` | Show `<leader>` mappings |
| `:KeyAnalyzer <leader>b` | Show mappings starting with `<leader>b*` |
| `:KeyAnalyzer <C-` | Show CTRL mappings |
| `:KeyAnalyzer <C- v` | Show CTRL mappings in visual mode |
| `:KeyAnalyzer <M-` | Show Alt/Meta/Option mappings |
| `:KeyAnalyzer <M-` | Show Alt/Meta/Option mappings |
| `:KeyAnalyzer <C-M>x i` | Show mappings starting with CTRL + M x in insert mode |



`:KeyAnalyzer` calls this lua code:
`require('key-analyzer').show(mode, prefix)` if you wish to map it yourself

> **Tip:** Click or move to any key to see its mapping details

## ⚙ Configuration


**Note**: The options are also available in Neovim by calling `:h key-analyzer.options`

```lua
require("key-analyzer").setup({
    -- Name of the command to use for the plugin
    command_name = "KeyAnalyzer", -- or nil to disable the command

    -- Customize the highlight groups
    highlights = {
        bracket_used = "KeyAnalyzerBracketUsed",
        letter_used = "KeyAnalyzerLetterUsed",
        bracket_unused = "KeyAnalyzerBracketUnused",
        letter_unused = "KeyAnalyzerLetterUnused",
        promo_highlight = "KeyAnalyzerPromo",

        -- Set to false if you want to define highlights manually
        define_default_highlights = true,
    },

    -- Keyboard layout to use
    -- Available options are: qwerty, colemak, colemak-dh, azerty, qwertz, dvorak
    layout = "qwerty",

    -- Should a link to https://x.com/OtivDev be displayed?
    promotion = true,
})
```

## Limitations

 - Not all maps will be shown. For example `<C-W>`, because these built in window maps are not returned by `vim.api.nvim_get_keymap(mode)`. Another example that will not show up are also fold maps (`z`).
 - Currently, `qwerty, colemak, colemak-dh, azerty, qwertz, dvorak` layouts are supported, but feel free to open a pull request
 - There is no differentiation between upper case and lower case letters, both will show on the visualisation
 - Remember: Some keys may not actually be bindable, for example <C-[>
 - KeyAnalyzer retreives mappings with `vim.api.nvim_get_keymap(mode)`, so local buffer mappings are not shown

## ⌨ Contributing

PRs and issues are always welcome. Make sure to provide as much context as possible when opening one.

Few ideas:
 - Different keyboard layouts via options
 - Add third parameter to a command `buffer` / `global`, where buffer calls `nvim_buf_get_keymap`
 - Bring in [presets from which-key.nvim](https://github.com/folke/which-key.nvim/blob/main/lua/which-key/plugins/presets.lua) so that built-in mappings work, eg. `<C-W>`, `z`, ...

 Find it interesting? [![X Follow](https://img.shields.io/twitter/follow/OtivDev)](https://x.com/OtivDev)

Thanks to [shortcuts](https://github.com/shortcuts) for the plugin boilerplate <3

