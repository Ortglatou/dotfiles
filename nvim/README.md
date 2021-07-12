# Neovim

Neovim is a text editor, currently my favorite. My configs are not much complex

## Keybindings

The leader key is space

* <span style="font-family: 'monospaced'">**\<leader\>** + **q**</span>
  * Quit if there's nothing to save
* <span style="font-family: 'monospaced'">**\<leader\>** + **\<leader\>**</span>
  * Save the changes
* <span style="font-family: 'monospaced'">**\<leader\>** + **r**</span>
  * Reload the configurations
* <span style="font-family: 'monospaced'">**\<leader\>** + **i**</span>
  * Install/update the plugins
* <span style="font-family: 'monospaced'">**t** + **n**</span>
  * Create a new tab
* <span style="font-family: 'monospaced'">**t** + **k**</span>
  * Go to the next tab
* <span style="font-family: 'monospaced'">**t** + **j**</span>
  * Go to the previous tab
* <span style="font-family: 'monospaced'">**t** + **h**</span>
  * Go to the first tab
* <span style="font-family: 'monospaced'">**t** + **l**</span>
  * Go to the last tab
* <span style="font-family: 'monospaced'">**t** + **"**</span>
  * Split window horizontally
* <span style="font-family: 'monospaced'">**t** + **%**</span>
  * Split window vertically
* <span style="font-family: 'monospaced'">**t** + **\<Left\>**</span>
  * Add 3 of vertical size from the current tab
* <span style="font-family: 'monospaced'">**t** + **\<Right\>**</span>
  * Remove 3 of vertical size from the current tab
* <span style="font-family: 'monospaced'">**t** + **\<Up\>**</span>
  * Add 3 of horizontal size from the current tab
* <span style="font-family: 'monospaced'">**t** + **\<Down\>**</span>
  * Remove 3 of horizontal size from the current tab

## Plugins

### Onedark

Onedark is currently my colorscheme

![Print_vim](../assets/vim_print.jpeg)

[joshdick/onedark.vim](https://github.com/joshdick/onedark.vim)

### Auto-pairs

Auto-pairs is a plugin I've been using for a while, it helps a lot because it
automatically complete chars that are usually written in pairs

[jiangmiao/auto-pairs](https://github.com/jiangmiao/auto-pairs)

### Coc

Coc is one of the plugins that I would most miss if I couldn't get my configs.
What is does is to bring some IDE's habilities to vim (neovim in my case),
autocompletion is what I'm talking about

[neoclide/coc.nvim](https://github.com/neoclide/coc.nvim)

### vim-which-key

This plugin is to help remembering the keybindings, it will pop-up a screen with
possibilities after pressing the leader key

[liuchengxu/vim-which-key](https://github.com/liuchengxu/vim-which-key)

### Vim-fugitive

To be honest I don't have configured this one properly yet, but from what I've
heard it provides integrations with git, I know it'll be very usefull

[tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

### Lightline

Lightline is a bottom line plugin, mainly used to prettify the editor

[itchyny/lightline.vim](https://github.com/itchyny/lightline.vim)

### Markdown-preview

This plugin is used to write markdown and see it, through a web browser

[iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
