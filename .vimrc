set nocompatible              " be iMproved, required
filetype off                  " required

"set tabstop=4
"set shiftwidth=4
set expandtab ts=4 sw=4 ai
"set vb t_vb=
set nowrap
set rnu
set nu
set noswapfile
set hlsearch
set incsearch
set backspace=indent,eol,start

syntax enable
colorscheme desert
let g:solarized_termcolors=256
let g:solarized_termtrans=0
func SetColor_dark()
	set background=dark
	colorscheme solarized
endfunc
func SetColor_light()
	set background=light
	colorscheme solarized
endfunc
func SetColor_desert()
	set background=dark
	colorscheme desert
endfunc
map <F6> :call SetColor_desert()<CR>
map <F7> :call SetColor_dark()<CR>
map <F8> :call SetColor_light()<CR>

""" compilation settings
func C()
    exec "w | !gcc % && ./a.out"
endfunc
func Python()
    exec "w | !python3 %"
endfunc
func Latex()
    exec "w | !latexmk --shell-escape -pdf % && latexmk -c"
endfunc
func Bash()
    exec "w | !bash %"
endfunc
func Arduino()
    exec "w | !arduino --upload % --port /dev/ttyACM0"
endfunc
autocmd FileType c map <C-e> :call C()<CR>
autocmd FileType python map <C-e> :call Python()<CR>
autocmd FileType tex map <C-e> :call Latex()<CR><CR>
autocmd FileType sh map <C-e> :call Bash()<CR>
autocmd FileType arduino map <C-e> :call Arduino()<CR>

""" BEGIN File Explorer

"" https://shapeshed.com/vim-netrw/
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
"	autocmd!
"	autocmd VimEnter * :Vexplore
"augroup END

"" https://vi.stackexchange.com/questions/10988/toggle-explorer-window
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
" Add your own mapping. For example:
noremap <silent> <C-q> :call ToggleNetrw()<CR>
""" END File Explorer
