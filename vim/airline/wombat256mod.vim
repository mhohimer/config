" vim-airline companion theme of wombat256mod

let s:lightyellow = 186
let s:yellow = 228
let s:lightred = 173
let s:red = 203
let s:violet = 177
let s:blue = 111
let s:lightblue = 153
let s:green = 113
let s:lightgreen = 192

let s:white = 252
let s:lightgray = 240
let s:gray = 238
let s:darkgray = 236
let s:black = 232

let g:airline#themes#wombat256mod#palette = {}

" [ guifg, guibg, ctermfg, ctermbg, opts ]

let s:WARN = ['', '', s:black, s:lightyellow]
let s:ERROR = ['', '', s:black, s:red]

let s:B = [ '' , '' , s:white , s:lightgray ]
let s:C = [ '' , '' , s:white , s:darkgray ]
let s:X = [ '' , '' , s:white , s:gray ]
let s:Y = [ '' , '' , s:white , s:lightgray ]

" Normal mode
let s:NA = [ '' , '' , s:black ,  s:blue]
let s:NZ = [ '' , '' , s:black ,  s:blue]
let g:airline#themes#wombat256mod#palette.normal = {
    \ 'airline_a': s:NA,
    \ 'airline_b': s:B,
    \ 'airline_c': s:C,
    \ 'airline_x': s:X,
    \ 'airline_y': s:Y,
    \ 'airline_z': s:NZ,
    \ 'airline_warning': s:WARN,
    \ 'airline_error': s:ERROR}

" Insert mode
let s:IA = [ '' , '' , s:black , s:green ]
let s:IZ = [ '' , '' , s:black , s:green ]
let g:airline#themes#wombat256mod#palette.insert = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:B,
    \ 'airline_c': s:C,
    \ 'airline_x': s:X,
    \ 'airline_y': s:Y,
    \ 'airline_z': s:IZ,
    \ 'airline_warning': s:WARN,
    \ 'airline_error': s:ERROR}


" Visual mode
let s:VA = [ '' , '' , s:black , s:violet ]
let s:VZ = [ '' , '' , s:black , s:violet ]
let g:airline#themes#wombat256mod#palette.visual = {
    \ 'airline_a': s:VA,
    \ 'airline_b': s:B,
    \ 'airline_c': s:C,
    \ 'airline_x': s:X,
    \ 'airline_y': s:Y,
    \ 'airline_z': s:VZ,
    \ 'airline_warning': s:WARN,
    \ 'airline_error': s:ERROR}


" Replace mode
let s:RA = [ '' , '' , s:black , s:red ]
let s:RZ = [ '' , '' , s:black , s:red ]
let g:airline#themes#wombat256mod#palette.replace = {
    \ 'airline_a': s:RA,
    \ 'airline_b': s:B,
    \ 'airline_c': s:C,
    \ 'airline_x': s:X,
    \ 'airline_y': s:Y,
    \ 'airline_z': s:RZ,
    \ 'airline_warning': s:WARN,
    \ 'airline_error': s:ERROR}


" Modified state for all modes
let s:MODIFIED = [ '' , '' , s:white , s:darkgray]


let s:modified = {
    \ 'airline_c': s:MODIFIED,
    \ 'airline_warning': s:WARN,
    \ 'airline_error': s:ERROR}
let g:airline#themes#wombat256mod#palette.insert_modified = s:modified
let g:airline#themes#wombat256mod#palette.normal_modified = s:modified
let g:airline#themes#wombat256mod#palette.visual_modified = s:modified
let g:airline#themes#wombat256mod#palette.replace_modified = s:modified


" Inactive mode
let s:IA = [ '' , '', s:white , s:gray , '' ]
let g:airline#themes#wombat256mod#palette.inactive = {
    \ 'airline_a': s:IA,
    \ 'airline_b': s:B,
    \ 'airline_c': s:C,
    \ 'airline_x': s:X,
    \ 'airline_y': s:Y,
    \ 'airline_z': s:IA,
    \ 'airline_warning': s:WARN,
    \ 'airline_error': s:ERROR}


let g:airline#themes#wombat256mod#palette.accents = {
    \ 'red': [ '' , '' , s:red , '' , '' ],
    \ 'airline_warning': s:WARN,
    \ 'airline_error': s:ERROR}


if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let s:P1 = [ '' , '' , s:white , s:gray ]
let s:P2 = [ '' , '' , s:white , s:lightgray]
let s:P3 = [ '' , '' , s:black , s:yellow, 'bold' ]
let g:airline#themes#wombat256mod#palette.ctrlp =
    \ airline#extensions#ctrlp#generate_color_map(s:P1, s:P2, s:P3)

