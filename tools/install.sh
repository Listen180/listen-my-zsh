#!/bin/bash
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2018-12-28 09:58
# * Last modified : 2018-12-28 09:58
# * Filename      : install.sh
# * Description   : Install listen-my-zsh
# *********************************************************


# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
    ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
    RED="$(tput setaf 1)"
    GREEN="$(tput setaf 2)"
    YELLOW="$(tput setaf 3)"
    BLUE="$(tput setaf 4)"
    BOLD="$(tput bold)"
    NORMAL="$(tput sgr0)"
else
    RED=""
    GREEN=""
    YELLOW=""
    BLUE=""
    BOLD=""
    NORMAL=""
fi

# Only enable exit-on-error after the non-critical colorization stuff,
# which may fail on systems lacking tput or terminfo
set -e


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
printf "${BLUE}Looking for an existing zsh config...${NORMAL}\n"
if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-listen-my-zsh${NORMAL}\n";
    mv ~/.zshrc ~/.zshrc.pre-listen-my-zsh;
fi

OS="$OSTYPE"

if [[ $OS == 'linux-gnu' ]]; then
    echo "  copying .zshrc for ${OSTYPE}"
    cp ~/.listen-my-zsh/Ubuntu/.zshrc ~/.zshrc
elif [[ $OS == 'darwin'* ]]; then
    echo "  copying .zshrc for ${OSTYPE}"
    cp ~/.listen-my-zsh/Mac/.zshrc ~/.zshrc
else
    echo "  OSTYPE NOT matched: ${OS}"
fi

#if [ -f ~/.zshrc ]; then
#    read -p "[~/.zshrc] file already exists. Are you going to remove it and use the default one in liste-my-zsh? [Y/n]: " choice
#    case "$choice" in 
#        y|Y )
#            echo "Updating ~/.zshrc ... "
#            rm ~/.zshrc
#            cp ~/.listen-my-zsh/Ubuntu/.zshrc ~/
#            ;;
#        n|N )
#            echo "Aborted. "
#            ;;
#        * )
#            echo "Invalid input. (Please choose 'y' or 'n')"
#            ;;
#    esac
#fi


## Copy the custom theme into ~/.oh-my-zsh/themes/
if [ -f ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme ]; then
    rm ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme
fi
echo "  copying custom themes into oh-my-zsh custom folder..."
cp ~/.listen-my-zsh/Ubuntu/mytheme.zsh-theme ~/.oh-my-zsh/custom/themes/mytheme.zsh-theme

## Make an alias for activatign ~/.zshrc 
alias actzsh="source ~/.zshrc"

#rm -rf ~/.listen-my-zsh



printf "${GREEN}"
echo '    __    _      __                                              __   '
echo '   / /   (_)____/ /____  ____     ____ ___  __  __   ____  _____/ /_  '
echo '  / /   / / ___/ __/ _ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '
echo ' / /___/ (__  ) /_/  __/ / / /  / / / / / / /_/ /    / /_(__  ) / / / '
echo '/_____/_/____/\__/\___/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '
echo '                                         /____/                       '
echo '                                                                 ... is now installed! '
printf "${NORMAL}"

