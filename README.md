# Vim settings

## Create the `.vim` folder if it doesn't exist

- In your Terminal.app (for Mac)
  - Get to  your home directory
    - `cd`
  - Make a new folder
    - `mkdir .vim`

## Clone the .vim folder

- Clone from this repo
  ```
  git clone https://github.com/ammonshepherd/vim.git .vim
  ```
## Link the .vimrc file
  ```
  ln -s .vim/.vimrc .vimrc
  ```

## Clone the Vundle plugin

- Follow the instructions here: https://github.com/VundleVim/Vundle.vim
- Basically, do this to get the files
  ```
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  ```
- And this to install the plugins
  ```
  vim +PluginInstall +qall
  ```
