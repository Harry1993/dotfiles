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
