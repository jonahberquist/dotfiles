set tabstop=2
set expandtab
syntax on

set title

set nohlsearch
set ruler

" Make F1 not open help, because I never mean to do that.
map <F1> <nop>
imap <F1> <nop>

" Remap recording macro from q to Q
nnoremap Q q
nnoremap q <nop>

set laststatus=2
set statusline=[\ %F\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ ]
hi StatusLine ctermbg=Black ctermfg=DarkCyan cterm=NONE
