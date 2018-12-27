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
@click.option(
    'file_type', '--type', '-t',
    help="Specify the file type. ",
    required=True,
#    prompt="Please specify package name",
)
@click.argument(
    'file_dir', 
    nargs=1, 
    type=click.Path(exists=True, file_okay=False, writable=True), 
    required=True, 
#    default='.',
)
def main(file_dir, file_type):
    """
    Python command line tool to check empty files. 
    """
    print('')
    print(f'Installing [oh-my-zsh] ...')
    print('')
    command_code = """
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
"""
    os.system(command_code)


if __name__ == '__main__':
    main()