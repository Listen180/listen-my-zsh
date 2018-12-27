#!/home/leisen/anaconda3/bin/python3
# -*- coding: UTF-8 -*-

# ********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2018-12-27 16:32
# * Last modified : 2018-12-27 16:32
# * Filename      : setup.py
# * Description   : 
# *********************************************************


import setuptools
import codecs
#from distutils.core import setup

version_number = input("Input the new version number you are going to use: ")


# Get the long description
with codecs.open('README.rst' ,'r') as f:
    #long_description = '\n{}'.format(f.read())
    long_description = f.read()


setuptools.setup(
#setup(
    name="listen-my-zsh",
    version=version_number,
    author="Sen LEI",
    author_email="sen.lei@outlook.com",
    description="A command line tool to automatically setup fancy zsh environment. ",
    long_description=long_description,
    #long_description_content_type="text/markdown",
    url="https://github.com/Listen180/listen-my-zsh",
    packages=['listen-my-zsh'],
    install_requires=[
        'wget',
        'click',
    ],
    license="BSD 3-clause",
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Programming Language :: Python :: 3.6",
        "License :: OSI Approved :: BSD License",
        "Operating System :: OS Independent",
    ],
    keywords='shell, zsh, environment configuration',
    entry_points={'console_scripts': [
        'dpzsh=listen-my-zsh.listen_my_zsh:main',
        ]},
)