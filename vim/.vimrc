set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()
filetype plugin indent on

set number
set	relativenumber
set autoindent
set smartindent
set cindent
set shiftwidth=4
set tabstop=4

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>

"-----------------------------------------------------------------------"
" Aiarline
"-----------------------------------------------------------------------"
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 "버퍼 목록 켜기
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_highlighting_cache = 1

let g:airline_powerline_fonts = 1
let g:airline_theme= 'minimalist'
let g:airline_section_y = '' 
let g:airline_section_warning= '' "마지막 status창 사용 안함
" 버퍼 목록 켜기
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden 

"----------------------------------------------------------------------"
" gruvbox 설정
"----------------------------------------------------------------------"
set background=dark
let g:gruvbox_contrast_dark = 'soft'
"let g:gruvbox_contrast_light = 'soft'
"let g:gruvbox_transparent_bg = '1'
let g:gruvbox_italic = 1
"let g:gruvbox_underline=1
"let g:gruvbox_undercurl=1
"let g:gruvbox_termcolors=16
"let g:gruvbox_number_column='aqua'
"let g:gruvbox_sign_column='aqua'
"let g:gruvbox_color_column='aqua'

" Force to use underline for spell check results
augroup SpellUnderline
  autocmd!
  autocmd ColorScheme *
    \ highlight SpellBad
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellCap
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellLocal
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  autocmd ColorScheme *
    \ highlight SpellRare
    \   cterm=Underline
    \   ctermfg=NONE
    \   ctermbg=NONE
    \   term=Reverse
    \   gui=Undercurl
    \   guisp=Red
  augroup END
set termguicolors
colorscheme gruvbox
