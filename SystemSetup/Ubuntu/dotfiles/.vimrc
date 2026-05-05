syntax on
set number
set mouse=a
set tabstop=4
set expandtab

" Create the directory if it doesn't exist (optional but helpful)
silent !mkdir -p ~/tmp/swp/ > /dev/null 2>&1

" Set the directory for swap files
set directory=~/tmp/swp//

" Bonus: Also redirect undo and backup files to keep things clean
set backupdir=~/tmp/swp//
set undodir=~/tmp/swp//
