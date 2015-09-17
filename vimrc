" Runtime path manipulation.
call pathogen#infect()

" Enable language-dependent indenting.
filetype plugin indent on

" Copy indent from current line when starting a new line.
set autoindent

" Delete comment character when joining commented lines.
set formatoptions+=j

" Git settings for better commit messages: enables spell checking and
" wrapps the text to 72 chars.
set backspace=2
autocmd Filetype gitcommit setlocal spell textwidth=72

" Enable color syntax highlighting.
syntax enable

" Allow color schemes to do bright colors without forcing bold.
set t_Co=16

" Solarized Light
set background=light
colorscheme solarized

" Match and highligh on red color trailing whitespaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Auto-strip trailing whitespaces from files on saving.
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction
autocmd BufWritePre * :call TrimWhiteSpace()
