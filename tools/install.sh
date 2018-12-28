#!/bin/bash
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2018-12-28 09:58
# * Last modified : 2018-12-28 09:58
# * Filename      : install.sh
# * Description   : Install listen-my-zsh
# *********************************************************

## Install oh-my-zsh
#if [ ! -d ~/.listen-my-zsh ]; then
#    echo " Installing oh-my-zsh ... "
#   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#    echo ""
#fi


## Install listen-my-zsh
if [ -d ~/.listen-my-zsh ]; then
    read -p "[~/.listen-my-zsh] folder already exists. Are you going to remove the previous folder and update? [Y/n]: " choice
    case "$choice" in 
        y|Y )
            echo "Removing previous folder ... "
            rm -rf ~/.listen-my-zsh
            git clone https://github.com/Listen180/listen-my-zsh.git ~/.listen-my-zsh
            echo ""
            echo "... latest [~/.listen-my-zsh] repo downloaded. "
            echo ""
            ;;
        n|N )
            echo "Aborted. "
            echo ""
            ;;
        * )
            echo "Invalid input. (Please choose 'y' or 'n')"
            echo ""
            ;;
    esac
else
    git clone https://github.com/Listen180/listen-my-zsh.git ~/.listen-my-zsh
    echo ""
    echo "... latest [~/.listen-my-zsh] repo downloaded. "
    echo ""
fi

## Copy the .zshrc file to ~/.zshrc
if [ -f ~/.zshrc ]; then
    read -p "[~/.zshrc] file already exists. Are you going to remove it and use the default one in liste-my-zsh? [Y/n]: " choice
    case "$choice" in 
        y|Y )
            echo "Updating ~/.zshrc ... "
            rm ~/.zshrc
            cp ~/.listen-my-zsh/Ubuntu/.zshrc ~/
            ;;
        n|N )
            echo "Aborted. "
            ;;
        * )
            echo "Invalid input. (Please choose 'y' or 'n')"
            ;;
    esac
fi

## Copy the custom theme into ~/.oh-my-zsh/themes/
if [ -f ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme ]; then
    rm ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme
fi
echo "  copying custom themes into oh-my-zsh custom folder..."
cp ~/.listen-my-zsh/Ubuntu/mytheme.zsh-theme ~/.oh-my-zsh/custom/themes/

## Make an alias for activatign ~/.zshrc 
alias actzsh="source ~/.zshrc"

#rm -rf ~/.listen-my-zsh



