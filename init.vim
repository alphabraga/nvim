" Minhas configurações do nvim.
" Algumas considerações: estou evitando plugins

" Configurações básicas
" Assim ele não fica compativel com o VI. Segundo alguns é melhor
" porque abraçamos as mudanças e deixamos pra tras comportamentos 
" antigos do VI

set nocompatible

" Assim fica tudo colorido e mais facil de identificar comentarios
" classes, strings e variaveis. Além disso visualmente atraente
syntax enable

" Isso habilita plugins especificos para cada tipo de arquivo

filetype plugin on

" Exibir o número da linha atual

set number

" Exibir os numeros das outras linhas relativas a linha atual.
" Essa configuração é combinada a anterior. Elas juntas criam esse
" efeito

set relativenumber

" Deixar mais X linhas no final da tela

set scrolloff=5

"Assim no modo normal a tecla Space é mapeada para ':'

nnoremap <Space> :

" Assim para escrever o arquivo basta no modo normal digitar Space+w
" E assim sucessivamente

" Ainda quero colocar o fzf + bat

call plug#begin('~/.local/share/nvim/plugged')

" Plugins aqui

" fzf + bat
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-lua/plenary.nvim' " dependência
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

" Opcional: define o preview bonito com bat
let $FZFDEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'

let g:fzf_action = { 'enter': 'tabedit' }

" Se Neovim for aberto com um diretório, roda :Files (fzf)
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | execute 'Files' | endif

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>

" Atalho para abrir o fzf+bat
noremap <silent> <Space>f  :Files<CR>

" alternar entre buffers

nnoremap <Space>b :Buffers<CR>

" buscar com um regex melhorado

nnoremap <Space>g :Rg<CR>

" historico de arquivos e comandos

nnoremap <Space>h :History<CR>


" Regua vertical na linha 80
set colorcolumn=80

" Esse é o meu arquivo de ajuda do nvim. Para chamar a minha ajuda basta
" digitar :Helpme
command! Helpme view ~/.config/nvim/myhelp.txt

" Remove o ntrw, que lista os arquivos ao abrir o nvim com `nvim .`
" autocmd VimEnter * if isdirectory(argv(0)) | bd | endif


let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1



" O comando abaixo serve para arquvios yaml. Muito usados no k8s em manifestos
"
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2



