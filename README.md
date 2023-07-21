# Dotfile Settings
> src: [Organizing your dotfiles](https://htoopyaelwin.medium.com/organizing-your-dotfiles-e059090a4bf5)

## What is dotfiles
打開terminal 在家目錄輸入 `ls -la` 可以看到許多如`.zshrc`, `.bashrc` 等設定檔，由於這些設定檔都是以`.`作為開頭，因此被稱呼為dotfiles

## Why organize dotfiles
希望將散落在家目錄的設定檔統一集中到一個資料夾，推上git做版控，並簡化多台電腦間的環境設定流程


## How to use
1. Download Homebrew
2. Clone `dotfiles` repo to local `~/.dotfiles` folder (or just download the zip file)
3. Install all packages in Brewfile
   
   ```
   brew bundle --file ~/.dotfiles/Brewfile
   ```
4. Make symlinks: Run `~/.install.sh` 
5. Remove symlinks: Run `~/.clean.sh`

## How to update dotfiles
Run `.update_dotfiles` script, the script includes two function:
- Create and overwrite the BrewFile.
- Push modified files to git remote repo.

## How to create dotfile
若原本Home directory就有設定檔，須將本的設定檔移到 `~/.dotfiles` 資料夾

### 步驟：
1. 在Home directory建立 `.dotfiles` 資料夾
2. 移動設定檔

   ```
   mv ~/.zshrc ~/.dotfiles/zsh/
   mv ~/.gitconfig ~/.dotfiles/gitconfig/
   mv ~/.vimrc ~/.dotfiles/vim/
   ```
3. 在 `~/.dotfiles` 路徑下建立BrewFile，會建立所有透過Homebrew下載的檔案清單

   ```
   brew bundle dump --describe
   ```
   若已存在此檔案可以使用下列指令更新
   ```
   brew bundle dump --force 
   #or 
   brew bundle dump --describe --force
   ```

### 注意事項：
- 需為每個設定檔建立directory
- 如果設定檔原本在家目錄，建立一層目錄即可

   ```
   /Users/username
   ├── .dotfiles
   │   └── zsh
   │       └── .zshrc
   └── .zshrc
   ```
- 如果設定檔原本在家目錄是巢狀結構，在 `.dotfiles`裡建立第一層目錄後也要模仿家目錄的結構

   ```
   /Users/username
   ├── .dotfiles
   │   └── nvim
   │       └── .config
   │           └── nvim
   |                ├── init.lua
   |                ├── lua
   |                └── spell
   └── .config
       └── nvim
           ├── init.lua
           ├── lua
           └── spell
   ```
