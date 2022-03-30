call plug#begin()
Plug 'cocopon/iceberg.vim'
call plug#end()

set number

set background=dark
set termguicolors
colorscheme iceberg


syntax on
filetype plugin indent on
set tabstop=4 shiftwidth=4 expandtab autoindent
set backspace=indent,eol,start
set spelllang=en
set nohlsearch
set clipboard=unnamedplus
set conceallevel=2
set cursorline
set colorcolumn=80

set laststatus=2

function! StatuslineActive()
    let l:statusline=''
    let l:statusline.="%#MyNormalColor#%{get(normal,mode(),'')}"
    let l:statusline.="%#MyCommandColor#%{get(command,mode(),'')}"
    let l:statusline.="%#MyInsertColor#%{get(insert,mode(),'')}"
    let l:statusline.="%#MyReplaceColor#%{get(replace,mode(),'')}"
    let l:statusline.="%#MyVisualColor#%{get(visual,mode(),'')}"

    let l:statusline.="%#MyStatusFile# %f "       " name of file
    let l:statusline.="%#MyStatusType#%= %r%m%y " " read only/modified/filetype
    let l:statusline.="%#MyStatusPercent# %3p%% " " percent through file
    let l:statusline.="%#MyStatusLoc# %l:%v "     " Position in file
    return l:statusline
endfunction

function! StatuslineInactive()
    let l:statusline=''
    let l:statusline.="%#MyInactiveColor#   ...   "

    let l:statusline.="%#MyStatusFile# %f "        " name of file
    let l:statusline.="%#MyStatusType#%= %r%m%y "  " read only/modified/filetype
    let l:statusline.="%#MyStatusPercent# %3p%% "  " percent through file
    let l:statusline.="%#MyStatusLoc# %l:%v "      " Position in file
    return l:statusline
endfunction

function! StatuslineColors()
    if &background == 'dark'
        hi MyNormalColor guifg=#161821 guibg=#818596
        hi MyCommandColor guifg=#161821 guibg=#818596
        hi MyInsertColor guifg=#161821 guibg=#84A0C6 
        hi MyReplaceColor guifg=#161821 guibg=#E27878
        hi MyVisualColor guifg=#161821 guibg=#E2A478
        hi MyInactiveColor guifg=#818596 guibg=#161821

        hi MyStatusFile guifg=#C6C8D1 guibg=#2E313F
        hi MyStatusType guifg=#444B71 guibg=#1E2132
        hi MyStatusLoc guifg=#161821 guibg=#818596
        hi MyStatusPercent guifg=#C6C8D1 guibg=#2E313F
    else
        hi MyNormalColor guifg=#E8E9EC guibg=#757CA3
        hi MyCommandColor guifg=#E8E9EC guibg=#757CA3
        hi MyInsertColor guifg=#E8E9EC guibg=#84A0C6 
        hi MyReplaceColor guifg=#E8E9EC guibg=#CC517A
        hi MyVisualColor guifg=#E8E9EC guibg=#C57339
        hi MyInactiveColor guifg=#757CA3 guibg=#E8E9EC

        hi MyStatusFile guifg=#33374C guibg=#9FA6C0
        hi MyStatusType guifg=#444B71 guibg=#DCDFE7
        hi MyStatusLoc guifg=#9FA7BD guibg=#757CA3
        hi MyStatusPercent guifg=#33374C guibg=#9FA6C0
    endif
endfunction

call StatuslineColors()
autocmd ColorScheme * call StatuslineColors()

let normal  = {'n': "  Normal  "}
let command = {'c': "  Command "}
let insert  = {"i": "  Insert  "}
let replace = {"R": "  Replace "}
let visual  = {"v": "  Visual  ",
        \ "\<C-v>": "  V-Block ",
        \      "V": "  V-Line  "}

augroup statusline
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!StatuslineActive()
    autocmd WinLeave,BufLeave * setlocal statusline=%!StatuslineInactive()
augroup end
