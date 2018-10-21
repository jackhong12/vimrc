# Vundle Setting
## 1. Install Vundle
>> `sudo apt-get install git curl`  
>> `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`  
>> <br>
> **plugin 安裝**
>> `vim +PluginInstall +qall`  
>> `將.ycm_extra_conf.py 移到 .vim`
>> 
<br>

## 2. [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
> 自動補全
>> `sudo apt-get install build-essential cmake`  
>> `sudo apt-get install python-dev`  
>> `cd ~/.vim/bundle/YouCompleteMe` 移到其他資料夾  
>>> C family補全  
>>> `./install.sh --clang-completer`  
>>>
>>> 不需要C family補全i  
>>> `./install.sh`  
>>> 
>> 更新python
>> `~/.vim/bundle/YouCompleteMeinstall.py`  
>> `sudo apt install build-essential cmake python3-dev`  
>>
<br>

## 3. [NERD Commenter](https://github.com/scrooloose/nerdcommenter)  
> Comment functions so powerful—no comment necessary.  
>> add in .vimrc  
>> `Plugin 'scrooloose/nerdcommenter'`  
>> 
<br>

## 4. [vim-airline](https://github.com/vim-airline/vim-airline)  
>Lean & mean status/tabline for vim that's light as air.  
>> add in .vimrc  
>> `Plugin 'vim-airline/vim-airline'`
>> `Plugin 'vim-airline/vim-airline-themes'`
