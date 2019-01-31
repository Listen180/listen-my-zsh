Listen My Zsh
=============

This is a Python Command Line Tool that automatically setup a fancy zsh environment for you, and of course you can customize futher later, the default configuration is my own customized version of `[oh-my-zsh] <https://ohmyz.sh/>`_. 

Hope it will accelerate your customization procedure of your own coding environment. 


Getting Started
###############


Prerequisites
-------------

Disclaimer: Listen My Zsh works best on macOS and Linux. 


- Unix-like operating system (macOS or Linux). 

- `Zsh <https://www.zsh.org>`_ should be installed (v4.3.9 or more recent). If not pre-installed (``zsh --version`` to confirm), check the following instruction here: `Installing ZSH <https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH>`_. 

- curl or wget should be installed. 

- git should be installed. 

- `oh-my-zsh <https://ohmyz.sh/>`_ should be installed. If not pre-installed, check the following instruction here: `Installing oh-my-zsh <https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH>`_; Or you could simply run: ``sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`` in your terminal. 



Installation
------------

via wget

.. code-block:: shell

   bash -c "$(wget https://raw.githubusercontent.com/Listen180/listen-my-zsh/master/tools/install.sh -O -)"



via curl

.. code-block:: shell

   bash -c "$(curl -fsSL https://raw.githubusercontent.com/Listen180/listen-my-zsh/master/tools/install.sh)"









-----------------------------------

|Sen LEI Website| |Sen LEI Github|

















.. |Sen LEI Github| image:: https://img.shields.io/badge/Github-Sen%20LEI-orange.svg?logo=github&longCache=true&style=flat&logoColor=white
   :target: https://github.com/Listen180

.. |Sen LEI Website| image:: https://img.shields.io/badge/Author-Sen%20LEI-orange.svg?logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANUAAADVCAMAAAD3nkWxAAACglBMVEUAAAD///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////9xjI0NAAAA1XRSTlMAAQIDBAUGBwgJCgsMDg8REhQXGBkaGxwdHh8gIiMkJSYnKCkqKywtLi8wMTI0NTY3ODk6Ozw9Pj9AQUJDREVGR0hJSktMTU5PUFJTVVZZWltcXV5fYGFkZWZnaGlqb3BxcnN0dXZ3ent8fYCBgoOFh4iKi4yNkJGSk5SVlpeZmpydnp+hoqOmp6ipqqusra6vsbKztLW2ubu8vsDDxMXGx8jJy8zNzs/Q0dLT1NXW19jZ3N3e3+Dh4uPk5ebn6Onq6+zt7u/w8fLz9PX29/j5+vv8/f7yOdf5AAAEF0lEQVR42u3da1fVVRAG8Ocgl8BCBQtJirQwqCwIk8DMMpIuplCIXcyiUioLKcssLVMjNCrCrOhCaqGppd1LKSsijgUY4DnP9+kVbzDgv8/ZL2ZY8/sOs+dZs9bMhjHGGGOMMcYYY4wxxhhjjPElPaegeGFxfs55mBgSCh7a1t7FYV3tr67OD0G1tMq3uni2P5qXpUKr+Tv+5mhObb8OGi38lGNrXxKCMmUHOb4D10OTzMYoA2nOgBpVYQbVsxw6nPMCXTSmQYGcL+nmyEyIN6eTrk5eAeFKwnTXUwLRCnsZi37RLTmvm7EJ50OsGZ2M1fELIFRiO2O3PwkyPcd4NECk8ijjEb0ZAqX9yPj8PBnyPMt4rYc4eYOM18BsSPM247cLwsyOMH6RWZClkT7sgCjTh+jDYCYkeZR+PAxJDtOPgxCkgL7MgRx19OUxyNFGX96HGMm99KU3GVIU059CSLGS/qyAFBvoTwOk2E1/WiDFEfrzBaT4if58Dym66U8XpBigP/9CiFCE/kRCEOIf+nMKUvxKf05Aim/pzzFI8Qn9+RhSbKM/r0CKNfSnFlLcRn/KIcV0ehPNhBjf0JevIMfL9GUT5LiTvtwOOVLD9COcCkG204+tkKSMfsyHJAlf04ejIYhSTR8qIUvSDz5mFokQ5l7GrwbSJHzGeH2eAHHmRhifyDVwoCU2vQiJJh+NL9emQaS8Psau9zIIVcPY3QOx6hmrdRBsk4IZjLtJOxmLpkkQLfQ83b2UAOmeiNJNtA4KVHTTRXgpVMje6xL+cqBE8uP9DKavLgl6ZL3JIN6dCV1u+Ijj+bAU+hS3DnF0Q+8UQaep97WPNnZZmwHFLqxp7By5vvNadTb0m1q0on5LY0tbS+OWp6sLp8AYY4wxxhgjTfKVlbVPPbN+bdXV52KCuLxu/xCHDe2rz4N6iXft40gdlYlQ7aZj/D/f3QG9prVyNO+dD6VKj3N0vy+CSncPcixnHoBCj0Q5jjVQZ1mU44muhDJlgxzfmTKoMuUEg/gtE5o0M5hmKFLKoBZDjVAHgzoUghblDG4JtNjD4NqgRHaEwUWyoMMqulgNHXbTRSt06KGLcAgaZNHNDGiwiG5uhAZVdFMFDR6km1XQoJZuapW0Kzf3T8i6Wg4NSuhmHjTIoJtpUOEkXfwCHZro4nXoUOO4SqFDej+DO50OJXYxuCZocVWUgc2FGh8wqD1woOX88sClUGQDg2mAJikHGERHClTJ7eH4ui+CMkW9Dv9t6HFLP8fWtxgKzfuLY/nzWqiUvddh70qP5HWnRyupJ5Og18VvRHi2yM4c6DZrc/fI93zzJdAv5daNhweHE9KhjeXJmCgScxdULK1YkJsIY4wxxhhjjDHGGGOMMcYYY4wxxhhjjBnhP6hK+cPRlZTHAAAAAElFTkSuQmCC&longCache=true&style=flat&logoColor=white
   :target: https://listen180.github.io/LEI-Sen/
