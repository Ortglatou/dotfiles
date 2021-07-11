"    Keybindings:
let mapleader="\<space>"
"        Quit:
nnoremap <leader>q :q<CR>
"        Save:
nnoremap <leader><leader> :w<CR>
"        Reload:
nnoremap <leader>r :source ~/.config/nvim/init.vim<CR>
"        UpdatePlug:
nnoremap <leader>i :PlugInstall<CR>
"        NewTab:
nnoremap tn :tabnew<CR>
"        NextTab:
nnoremap tk :tabnext<CR>
"        PreviousTab:
nnoremap tj :tabprev<CR>
"        FirstTab:
nnoremap th :tabfirst<CR>
"        LastTab:
nnoremap tl :tablast<CR>
"        Split:
nnoremap t" :split<CR>
"        VerticalSplit:
nnoremap t% :vsplit<CR>
"        ResizeLeft:
nnoremap t<Left> :vertical resize +3<CR>
"        ResizeRight:
nnoremap t<Right> :vertical resize -3<CR>
"        ResizeUp:
nnoremap t<Up> :resize +3<CR>
"        ResizeDown:
nnoremap t<Down> :resize -3<CR>
