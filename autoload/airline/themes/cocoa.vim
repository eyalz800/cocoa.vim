" =============================================================================
" URL: https://github.com/ghifarit53/cocoa-vim/
" Filename: autoload/airline/themes/cocoa.vim
" Author: Brian Gianforcaro
" Email: b.gianfo@gmail.com
" License: MIT License
" =============================================================================

let g:airline#themes#cocoa#palette = {}

let s:style = get(g:, 'cocoa_style', 'dark')

if s:style ==# 'dark'
	let s:foreground = [ '#a9b1d6', 250 ]
	let s:background = [ '#1a1b26', 235 ]
	let s:background_alt = [ '#232433', 236 ]
	let s:background_grey = [ '#444B6A', 238 ]
	let s:red = [ '#F7768E', 203 ]
	let s:yellow = [ '#E0AF68', 179 ]
	let s:green = [ '#9ECE6A', 107 ]
	let s:blue = [ '#7AA2F7', 110 ]
	let s:purple = [ '#ad8ee6', 176 ]
elseif s:style ==# 'light'
	let s:foreground = [ '#a9b1d6', 250 ]
	let s:background = [ '#24283b', 235 ]
	let s:background_alt = [ '#2c3047', 236 ]
	let s:background_grey = [ '#444B6A', 238 ]
	let s:red = [ '#F7768E', 203 ]
	let s:yellow = [ '#E0AF68', 179 ]
	let s:green = [ '#9ECE6A', 107 ]
	let s:blue = [ '#7AA2F7', 110 ]
	let s:purple = [ '#ad8ee6', 176 ]
endif


let s:black    = ['#321918', 00]
let s:red      = ['#97001A', 01]
let s:green    = ['#305B12', 02]
let s:yellow   = ['#7C493E', 03]
let s:blue     = ['#573E55', 04]
let s:burgundy = ['#66292F', 05]
let s:orange   = ['#BF472C', 06]
let s:grey     = ['#E0CCAE', 07]
let s:brown    = ['#4D241F', 08]
let s:pink     = ['#FF947C', 09]
let s:lime     = ['#CACF56', 10]
let s:bryellow = ['#F5BB89', 11]
let s:skyblue  = ['#E2CCCD', 12]
let s:cordovan = ['#CF9D7E', 13]
let s:brorange = ['#E08F44', 14]
let s:white    = ['#F2DDBC', 15]

"                                         guifg            guibg                 ctermfg          ctermbg
if s:style ==# 'dark'
    let s:airline_mode_normal         = [ s:bryellow[0],   s:burgundy[0],        s:bryellow[1],   s:blue[1]            ]
    let s:airline_mode_insert         = [ s:bryellow[0],   s:green[0],           s:bryellow[1],   s:green[1]           ]
    let s:airline_mode_replace        = [ s:bryellow[0],   s:red[0],             s:bryellow[1],   s:red[1]             ]
    let s:airline_mode_visual         = [ s:bryellow[0],   s:orange[0],          s:bryellow[1],   s:orange[1]          ]
    let s:airline_mode_inactive       = [ s:grey[0],       s:yellow[0],          s:grey[1],       s:yellow[1]          ]

    let s:airline_warning             = [ s:bryellow[0],   s:orange[0],          s:bryellow[1],   s:blue[1]            ]
    let s:airline_error               = [ s:bryellow[0],   s:red[0],             s:bryellow[1],   s:blue[1]            ]
    let s:airline_middle              = [ s:grey[0],       s:yellow[0],             s:bryellow[1],   s:blue[1]            ]

    let s:airline_info                = [ s:bryellow[0],   s:yellow[0],          s:grey[1],       s:yellow[1] ]
    let s:airline_statusline          = [ s:bryellow[0],   s:brown[0],           s:grey[1],       s:yellow[1]  ]
elseif s:style ==# 'light'
endif


function! s:cocoa_color_map(mode)
	return airline#themes#generate_color_map(a:mode, s:airline_info, s:airline_statusline)
endfunction

let g:airline#themes#cocoa#palette.normal = s:cocoa_color_map(s:airline_mode_normal)
let g:airline#themes#cocoa#palette.normal.airline_warning = s:airline_warning
let g:airline#themes#cocoa#palette.normal.airline_error = s:airline_error
let g:airline#themes#cocoa#palette.insert = s:cocoa_color_map(s:airline_mode_insert)
let g:airline#themes#cocoa#palette.insert.airline_warning = s:airline_warning
let g:airline#themes#cocoa#palette.insert.airline_error = s:airline_error
let g:airline#themes#cocoa#palette.replace = s:cocoa_color_map(s:airline_mode_replace)
let g:airline#themes#cocoa#palette.replace.airline_warning = s:airline_warning
let g:airline#themes#cocoa#palette.replace.airline_error = s:airline_error
let g:airline#themes#cocoa#palette.inactive = s:cocoa_color_map(s:airline_mode_inactive)
let g:airline#themes#cocoa#palette.inactive.airline_warning = s:airline_warning
let g:airline#themes#cocoa#palette.inactive.airline_error = s:airline_error
let g:airline#themes#cocoa#palette.visual = s:cocoa_color_map(s:airline_mode_visual)
let g:airline#themes#cocoa#palette.visual.airline_warning = s:airline_warning
let g:airline#themes#cocoa#palette.visual.airline_error = s:airline_error
let g:airline#themes#cocoa#palette.terminal = s:cocoa_color_map(s:airline_mode_insert)
let g:airline#themes#cocoa#palette.normal.airline_term = s:airline_statusline
let g:airline#themes#cocoa#palette.terminal.airline_term = s:airline_statusline
let g:airline#themes#cocoa#palette.visual.airline_term = s:airline_statusline
