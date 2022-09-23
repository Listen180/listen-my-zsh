#!/bin/bash
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2018-12-28 09:58
# * Last modified : 2022-08-11 14:58
# * Filename      : install_docker.sh
# * Description   : Install listen-my-zsh
# *********************************************************


# Use colors, but only if connected to a terminal, and that terminal supports them.
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

# Only enable exit-on-error after the non-critical colorization stuff, which may fail on systems lacking tput or terminfo
set -e


## Install oh-my-zsh
#if [ ! -d ~/.oh-my-zsh ]; then
#    echo " Installing oh-my-zsh ... "
#   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#    echo ""
#fi

## Install listen-my-zsh
if [ -d ~/.listen-my-zsh ]; then
    echo "Removing previous folder ... "
    rm -rf ~/.listen-my-zsh
    git clone https://github.com/Listen180/listen-my-zsh.git ~/.listen-my-zsh
    echo ""
    echo "... latest [~/.listen-my-zsh] repo downloaded. "
    echo ""
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
    if [ -f ~/.zshrc.pre-listen-my-zsh ]; then
        cp ~/.zshrc ~/.zshrc.listen-my-zsh-old-version;
    else
        cp ~/.zshrc ~/.zshrc.pre-listen-my-zsh;
    fi
    rm ~/.zshrc
    UPDATE_ZSHRC="TRUE"
else
    UPDATE_ZSHRC="TRUE"
fi


if [[ "$OSTYPE" == 'linux-gnu' ]]; then
    if [[ "$UPDATE_ZSHRC" == 'TRUE' ]]; then
        echo "  updating .zshrc for Linux ..."
        cp ~/.listen-my-zsh/Ubuntu/.zshrc ~/.zshrc
    else
        echo "  .zshrc not updated. "
    fi
    echo "  updating .zshfunc for Linux ..."
    cp ~/.listen-my-zsh/Ubuntu/.zshfunc ~/.zshfunc
    echo "  updating .zshfuncs/ folder for Linux ..."
    if [ -d ~/.zshfuncs ];then
        if [ -d ~/.zshfuncs-old-version ];then
            rm -r ~/.zshfuncs-old-version
        fi
        mv ~/.zshfuncs ~/.zshfuncs-old-version;
    fi
    cp -r ~/.listen-my-zsh/Ubuntu/.zshfuncs ~/.zshfuncs
elif [[ "$OSTYPE" == 'linux-gnueabihf' ]]; then
    if [[ "$UPDATE_ZSHRC" == 'TRUE' ]]; then
        echo "  updating .zshrc for RasPi ..."
        cp ~/.listen-my-zsh/RasPi/.zshrc ~/.zshrc
    else
        echo "  .zshrc not updated. "
    fi
    echo "  updating .zshfunc for RasPi ..."
    cp ~/.listen-my-zsh/RasPi/.zshfunc ~/.zshfunc
    echo "  updating .zshfuncs/ folder for RasPi ..."
    if [ -d ~/.zshfuncs ];then
        if [ -d ~/.zshfuncs-old-version ];then
            rm -r ~/.zshfuncs-old-version
        fi
        mv ~/.zshfuncs ~/.zshfuncs-old-version;
    fi
    cp -r ~/.listen-my-zsh/RasPi/.zshfuncs ~/.zshfuncs
elif [[ "$OSTYPE" == 'darwin'* ]]; then
    if [[ "$UPDATE_ZSHRC" == 'TRUE' ]]; then
        echo "  updating .zshrc for Mac OS ..."
        cp ~/.listen-my-zsh/Mac/.zshrc ~/.zshrc
    else
        echo "  .zshrc not updated. "
    fi
    echo "  updating .zshfunc for Mac OS ..."
    cp ~/.listen-my-zsh/Mac/.zshfunc ~/.zshfunc
    echo "  updating .zshfuncs/ folder for Mac OS ..."
    if [ -d ~/.zshfuncs ];then
        if [ -d ~/.zshfuncs-old-version ];then
            rm -r ~/.zshfuncs-old-version
        fi
        mv ~/.zshfuncs ~/.zshfuncs-old-version;
    fi
    cp -r ~/.listen-my-zsh/Mac/.zshfuncs ~/.zshfuncs
else
    echo "  OS-Type NOT matched: ${OSTYPE} "
    #echo "    (No file copied)"
    if [[ "$UPDATE_ZSHRC" == 'TRUE' ]]; then
        echo "  updating .zshrc for Linux ..."
        cp ~/.listen-my-zsh/Ubuntu/.zshrc ~/.zshrc
    else
        echo "  .zshrc not updated. "
    fi
    echo "  updating .zshfunc for Linux ..."
    cp ~/.listen-my-zsh/Ubuntu/.zshfunc ~/.zshfunc
    echo "  updating .zshfuncs/ folder for Linux ..."
    if [ -d ~/.zshfuncs ];then
        if [ -d ~/.zshfuncs-old-version ];then
            rm -r ~/.zshfuncs-old-version
        fi
        mv ~/.zshfuncs ~/.zshfuncs-old-version;
    fi
    cp -r ~/.listen-my-zsh/Ubuntu/.zshfuncs ~/.zshfuncs
fi



## Copy the custom theme into ~/.oh-my-zsh/themes/
if [ -f ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/mytheme.zsh-theme ]; then
    rm ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/mytheme.zsh-theme
fi
if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/ ]; then
    echo "  copying custom themes into oh-my-zsh custom folder..."
    cp ~/.listen-my-zsh/custom/themes/LEISen.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/mytheme.zsh-theme
else
    echo "  .oh-my-zsh folder not found. ${ZSH_CUSTOM}"
fi

## Make an alias for activatign ~/.zshrc 
alias actzsh="source ~/.zshrc"


## VIM Configuration
echo "  configuring vim ..."
if [ -f ~/.vimrc ]; then
    rm ~/.vimrc
    echo "  updating .vimrc ... "
    cp ~/.listen-my-zsh/Mac/vim/.vimrc ~/.vimrc
else
    echo "  .vimrc not existed. [using online version]"
    cp ~/.listen-my-zsh/Mac/vim/.vimrc ~/.vimrc
fi


## Add plugins (into oh-my-zsh custom folder)
if [ -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ]; then
    echo "[${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting] folder already exists. "
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

echo ''
printf "${GREEN}"
echo '    __    _      __                                              __   '
echo '   / /   (_)____/ /____  ____     ____ ___  __  __   ____  _____/ /_  '
echo '  / /   / / ___/ __/ _ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '
echo ' / /___/ (__  ) /_/  __/ / / /  / / / / / / /_/ /    / /_(__  ) / / / '
echo '/_____/_/____/\__/\___/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '
echo '                                         /____/                       '
echo '                                                                 ... is now installed! '
printf "${NORMAL}"

## Activate new [.zshrc]
printf "${YELLOW}Restart the terminal to activate the new configuration!${NORMAL}\n";


