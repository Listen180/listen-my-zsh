#!/home/leisen/anaconda3/bin/python3
# -*- coding: UTF-8 -*-

# ********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2018-12-27 16:28
# * Last modified : 2018-12-27 16:28
# * Filename      : listen-my-zsh.py
# * Description   : 
# *********************************************************


import sys
import os
import click
import platform



HERE = os.path.dirname(os.path.abspath(__file__))
OS_TYPE = platform.platform().split('-')[0]



@click.command()
def oh_my_zsh():
    """
    Install oh-my-zsh
    """
    print('')
    print(f'Installing [oh-my-zsh] ...')
    print('')
    command_code = """
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
"""
    os.system(command_code)



@click.command()
def listen_my_zsh():
    """
    Install listen-my-zsh (using my customized [.zshrc] file)
    """
    print('')
    print(f'Installing [listen-my-zsh] ...')
    print('')
    command_code = """
if [ -d ~/.listen-my-zsh ]; then
    read -p "[~/.listen-my-zsh] folder already exists. Are you going to remove the folder and update (Y/n)?" choice
    case "$choice" in 
        y|Y )
            echo "Removing previous folder ... "
            rm -rf ~/.listen-my-zsh
            ;;
        n|N )
            echo "Aborted"
            exit
            ;;
        * )
            echo "invalid"
            exit
            ;;
    esac
fi
git clone https://github.com/Listen180/listen-my-zsh.git ~/.listen-my-zsh
echo ""
echo "... latest [~/.listen-my-zsh] repo downloaded. "
echo ""
cp ~/.listen-my-zsh/Ubuntu/.zshrc ~/
"""
    os.system(command_code)


@click.command()
def listen_remove():
    """
    Revome folder: ~/.listen-my-zsh
    """
    command_code = """
rm -rf ~/listen-my-zsh
"""
    os.system(command_code)



@click.command()
@click.option(
    'theme_name', '--theme', '-t',
    help="Specify the theme name. ",
    required=False,
#    prompt="Please specify theme name",
)
#@click.argument(
#    'file_dir', 
#    nargs=1, 
#    type=click.Path(exists=True, file_okay=False, writable=True), 
#    required=True, 
#)
def main(theme_name):
    """
    Python command line tool to automatically setup fancy zsh environment.  
    """
    oh_my_zsh()
    listen_my_zsh()






if __name__ == '__main__':
    main()