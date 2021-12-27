"  __  __      _ _
" |  \/  | ___| | | _____      __
" | |\/| |/ _ \ | |/ _ \ \ /\ / /
" | |  | |  __/ | | (_) \ V  V /
" |_|  |_|\___|_|_|\___/ \_/\_/
"
" Maintainer: adigitoleo <adigitoleo@protonmail.com>
" Version: 1.2.1
" Description: A warm, minimalist colorscheme for (neo)vim
" Homepage: https://github.com/adigitoleo/vim-mellow


let s:script_name = expand('<sfile>:t:r')

" Clear highlights and set options. {{{1

hi clear

if v:version > 580
    if exists('g:syntax_on')
        syntax reset
    endif
endif

let g:colors_name = s:script_name

" By default, DO define colors for :terminal.
let s:opt_terminal_colors = get(g:, s:script_name .. '_terminal_colors', 1)

" By default, DO NOT define User1-9 colors for statusline.
let s:opt_user_colors = get(g:, s:script_name .. '_user_colors', 0)

" Define color palette. {{{1

let s:colors = [
            \ '#0F0908',
            \ '#97001A',
            \ '#3C5E15',
            \ '#865448',
            \ '#573E55',
            \ '#66292F',
            \ '#BF472C',
            \ '#E0CCAE',
            \ '#2D140F',
            \ '#FF9487',
            \ '#A4BF40',
            \ '#F5BB89',
            \ '#CFCAD0',
            \ '#BA8B93',
            \ '#D47D49',
            \ '#F2DDBC',
            \]

" Define highlight setter function. {{{1

function! s:hi(group, bg, fg, ...) abort
    " Parse bg and fg strings, e.g. 'NONE', or integers in the range [0,15].
    let l:guibg = type(a:bg) == type('') ? a:bg : s:colors[a:bg]
    let l:guifg = type(a:fg) == type('') ? a:fg : s:colors[a:fg]

    let l:colors = printf(
                \ 'highlight %s ctermbg=%s guibg=%s ctermfg=%s guifg=%s',
                \ a:group, a:bg, l:guibg, a:fg, l:guifg
                \)

    " By default, set special attributes to 'NONE'.
    let l:options = 'NONE'

    for l:opt in a:000
        if type(l:opt) == type('')
            " Parse special attribute string.
            let l:options = l:opt
        elseif type(l:opt) == type(0)
            " Parse guisp color integer in the range [0,15].
            let l:colors .= printf(' guisp=%s', s:colors[l:opt])
        endif
    endfor

    return printf('%s cterm=%s gui=%s', l:colors, l:options, l:options)
endfunction

" Set main colors. {{{1

if &background ==# 'light'
    "   group------------------ bg--------- fg--------- special-------
    exe s:hi('Comment',         'NONE',     2)
    exe s:hi('Constant',        'NONE',     6)
    exe s:hi('Cursor',          0,          15)
    exe s:hi('CursorLine',      7,          'NONE')
    exe s:hi('CursorLineNr',    11,         5)
    exe s:hi('DiffAdd',         10,         'NONE')
    exe s:hi('DiffChange',      11,         'NONE')
    exe s:hi('DiffDelete',      15,         12,         'bold')
    exe s:hi('DiffText',        9,          'NONE',     'underline')
    exe s:hi('Directory',       'NONE',     6)
    exe s:hi('Error',           1,          15,         'bold,reverse')
    exe s:hi('ErrorMsg',        1,          15)
    exe s:hi('Folded',          7,          5)
    exe s:hi('FoldColumn',      14,         11)
    exe s:hi('Function',        'NONE',     5)
    exe s:hi('Identifier',      'NONE',     5)
    exe s:hi('Ignore',          'NONE',     'NONE')
    exe s:hi('IncSearch',       9,          0,          'underline')
    exe s:hi('LineNr',          7,          14)
    exe s:hi('ModeMsg',         6,          15,         'bold,reverse')
    exe s:hi('MoreMsg',         3,          15,         'bold,reverse')
    exe s:hi('NonText',         15,         10)
    exe s:hi('Normal',          15,         0)
    exe s:hi('Pmenu',           11,         0)
    exe s:hi('PmenuSel',        10,         8)
    exe s:hi('PmenuSbar',       3,          8)
    exe s:hi('Search',          12,         0)
    exe s:hi('SignColumn',      11,         5)
    exe s:hi('Special',         'NONE',     3)
    exe s:hi('SpecialKey',      15,         12,         'bold')
    exe s:hi('SpellBad',        15,         1,          'underline', 9)
    exe s:hi('SpellCap',        15,         4,          'underline', 12)
    exe s:hi('SpellLocal',      15,         6,          'underline', 14)
    exe s:hi('SpellRare',       15,         3,          'underline', 11)
    exe s:hi('Statement',       'NONE',     1)
    exe s:hi('StatusLine',      11,         5)
    exe s:hi('StatusLineNC',    7,          3,          'underline')
    exe s:hi('String',          'NONE',     4)
    exe s:hi('Todo',            10,         8,          'bold')
    exe s:hi('Underlined',      'NONE',     'NONE',     'underline')
    exe s:hi('VertSplit',       11,         6)
    exe s:hi('Visual',          10,         'NONE')
    exe s:hi('VisualNOS',       'NONE',     'NONE',     'underline')

    highlight! link ColorColumn      CursorLine
    highlight! link Conceal          Special
    highlight! link CursorColumn     CursorLine
    highlight! link CursorIM         Cursor
    highlight! link EndOfBuffer      Normal
    highlight! link MatchParen       PmenuSel
    highlight! link Number           Constant
    highlight! link PmenuThumb       PmenuSel
    highlight! link PreProc          Identifier
    highlight! link Question         ModeMsg
    highlight! link QuickFixLine     Underlined
    highlight! link StatusLineTerm   StatusLine
    highlight! link StatusLineTermNC StatusLineNC
    highlight! link TabLine          StatusLineNC
    highlight! link TabLineFill      StatusLineNC
    highlight! link TabLineSel       StatusLine
    highlight! link Terminal         Normal
    highlight! link Title            Ignore
    highlight! link Type             Function
    highlight! link WarningMsg       Error
    highlight! link WildMenu         Visual
    highlight! link helpLeadBlank    Normal
    highlight! link helpNormal       Normal

else
    " -------- group ---------- bg--------- fg -------- special -------
    exe s:hi('Comment',         'NONE',     10)
    exe s:hi('Constant',        'NONE',     14)
    exe s:hi('Cursor',          7,          0)
    exe s:hi('CursorLine',      8,          'NONE')
    exe s:hi('CursorLineNr',    5,          11,         'bold')
    exe s:hi('DiffAdd',         2,          'NONE')
    exe s:hi('DiffChange',      5,          'NONE')
    exe s:hi('DiffDelete',      'NONE',     1,          'bold')
    exe s:hi('DiffText',        1,          'NONE',     'underline')
    exe s:hi('Directory',       'NONE',     14)
    exe s:hi('Error',           0,          9,          'bold')
    exe s:hi('ErrorMsg',        1,          15)
    exe s:hi('Folded',          8,          11)
    exe s:hi('FoldColumn',      3,          5)
    exe s:hi('Function',        'NONE',     13)
    exe s:hi('Identifier',      'NONE',     13,         'bold')
    exe s:hi('Ignore',          'NONE',     'NONE')
    exe s:hi('IncSearch',       1,          15,         'underline')
    exe s:hi('LineNr',          8,          14)
    exe s:hi('ModeMsg',         'NONE',     14,         'bold')
    exe s:hi('MoreMsg',         'NONE',     5,          'bold')
    exe s:hi('NonText',         0,          2)
    exe s:hi('Normal',          0,          15)
    exe s:hi('Pmenu',           3,          15)
    exe s:hi('PmenuSel',        2,          7)
    exe s:hi('PmenuSbar',       5,          7)
    exe s:hi('Search',          4,          15)
    exe s:hi('SignColumn',      5,          7)
    exe s:hi('Special',         'NONE',     11)
    exe s:hi('SpecialKey',      'NONE',     8,          'bold')
    exe s:hi('SpellBad',        0,          9,          'underline', 1)
    exe s:hi('SpellCap',        0,          15,         'underline', 7)
    exe s:hi('SpellLocal',      0,          14,         'underline', 6)
    exe s:hi('SpellRare',       0,          12,         'underline', 4)
    exe s:hi('Statement',       'NONE',     9)
    exe s:hi('StatusLine',      3,          11,         'bold')
    exe s:hi('StatusLineNC',    8,          11,         'bold,underline')
    exe s:hi('String',          'NONE',     12)
    exe s:hi('Todo',            2,          11,         'bold')
    exe s:hi('Underlined',      'NONE',     'NONE',     'underline')
    exe s:hi('VertSplit',       3,          5)
    exe s:hi('Visual',          2,          'NONE')

    highlight! link ColorColumn      CursorLine
    highlight! link Conceal          Special
    highlight! link CursorColumn     CursorLine
    highlight! link CursorIM         Cursor
    highlight! link EndOfBuffer      Normal
    highlight! link MatchParen       PmenuSel
    highlight! link Number           Constant
    highlight! link PmenuThumb       PmenuSel
    highlight! link PreProc          Identifier
    highlight! link Question         ModeMsg
    highlight! link QuickFixLine     Underlined
    highlight! link StatusLineTerm   StatusLine
    highlight! link StatusLineTermNC StatusLineNC
    highlight! link TabLine          StatusLineNC
    highlight! link TabLineFill      StatusLineNC
    highlight! link TabLineSel       StatusLine
    highlight! link Terminal         Normal
    highlight! link Title            Ignore
    highlight! link Type             Function
    highlight! link WarningMsg       Error
    highlight! link WildMenu         Visual
    highlight! link helpLeadBlank    Normal
    highlight! link helpNormal       Normal
endif

" Set terminal colors. {{{1

if s:opt_terminal_colors
    if has('nvim')
        for idx in range(16)
            call nvim_set_var('terminal_color_' .. idx, s:colors[idx])
        endfor
    elseif has('terminal')
        let g:terminal_ansi_colors = s:colors
    endif
endif

" Set optional statusline groups, see :h hl-User1 {{{1

if s:opt_user_colors
    if &background ==# 'light'
        " Colors for statusline diagnostics: red (1) and green (2).
        exe s:hi('default User1',   11, 1,  'bold')
        exe s:hi('default User2',   11, 2,  'bold')
        " Subtle colors for miscellaneous indicators: sand (3) and orange (4).
        exe s:hi('default User3',   11, 13)
        exe s:hi('default User4',   11, 14)
        " Inverse colors for mode indicators:
        " cordovan (5), green (6), orange (7), red (8) and blue (9)
        exe s:hi('default User5',   13, 11, 'bold')
        exe s:hi('default User6',   2,  11, 'bold')
        exe s:hi('default User7',   14, 11, 'bold')
        exe s:hi('default User8',   1,  11, 'bold')
        exe s:hi('default User9',   4,  11, 'bold')

    else
        " Colors for statusline diagnostics: red (1) and green (2).
        exe s:hi('default User1',   5,  9,  'bold')
        exe s:hi('default User2',   5,  10, 'bold')
        " Subtle colors for miscellaneous indicators: sand (3) and orange (4).
        exe s:hi('default User3',   5,  13)
        exe s:hi('default User4',   5,  14)
        " Inverse colors for mode indicators:
        " cordovan (5), green (6), orange (7), red (8) and blue (9)
        exe s:hi('default User5',   13, 11, 'bold')
        exe s:hi('default User6',   2,  11, 'bold')
        exe s:hi('default User7',   6,  11, 'bold')
        exe s:hi('default User8',   1,  11, 'bold')
        exe s:hi('default User9',   4,  11, 'bold')
    endif
endif

" }}}

" vim: fdm=marker
