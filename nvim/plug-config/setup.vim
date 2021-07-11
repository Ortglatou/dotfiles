" Auto install
if ( empty( glob( "~/.local/share/nvim/site/autoload/plug.vim" ) ) )
    :exec ":!sh -c 'curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"
endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'joshdick/onedark.vim' " Colorscheme
    Plug 'jiangmiao/auto-pairs' " Autocompleate pairs such as ( and )
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletions and things like this
    Plug 'liuchengxu/vim-which-key' " Key helper
    Plug 'tpope/vim-fugitive' " Git controller
    Plug 'vim-airline/vim-airline' " Statusbar
    Plug 'vim-airline/vim-airline-themes' " Statusbar themes
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } " Markdown live preview
call plug#end()

source ${HOME}/.config/nvim/plug-config/colorscheme.vim
source ${HOME}/.config/nvim/plug-config/coc.vim
source ${HOME}/.config/nvim/plug-config/whichkey.vim
source ${HOME}/.config/nvim/plug-config/airline.vim
