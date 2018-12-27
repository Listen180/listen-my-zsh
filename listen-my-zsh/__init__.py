#!/home/leisen/anaconda3/bin/python3
# -*- coding: UTF-8 -*-

# ********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2018-12-27 16:37
# * Last modified : 2018-12-27 16:37
# * Filename      : __init__.py
# * Description   : 
# *********************************************************


import time
import platform
import subprocess

class avatar(object):
    def __init__(self):
        self._judge()
        if self.n == 1:
            self.type_1()
        elif self.n == 2:
            self.type_2()
        elif self.n == 3:
            self.type_3()

    def _judge(self):
        os_type = platform.platform().split('-')[0]
        if os_type == 'Darwin':
            self.n = 1
        elif os_type == 'Linux':
            self.n = 2
        elif os_type == 'Windows':
            self.n = 3
        else:
            self.n = 2

    def type_1(self):
        info = """
    __    _      __                                              __  
   / /   (_)____/ /____  ____     ____ ___  __  __   ____  _____/ /_ 
  / /   / / ___/ __/ _ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
 / /___/ (__  ) /_/  __/ / / /  / / / / / / /_/ /    / /_(__  ) / / /
/_____/_/____/\__/\___/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/ 
                                         /____/                      

                       Copyright 2018 Sen LEI 
                       All Rights Reserved
                """
        print(info)
        time.sleep(1)

    def type_2(self):
        info = """
    __    _      __                                              __  
   / /   (_)____/ /____  ____     ____ ___  __  __   ____  _____/ /_ 
  / /   / / ___/ __/ _ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
 / /___/ (__  ) /_/  __/ / / /  / / / / / / /_/ /    / /_(__  ) / / /
/_____/_/____/\__/\___/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/ 
                                         /____/                      

                       Copyright 2018 Sen LEI 
                       All Rights Reserved
                """
        print(info)
        time.sleep(1)

    def type_3(self):
        info = """
    __    _      __                                              __  
   / /   (_)____/ /____  ____     ____ ___  __  __   ____  _____/ /_ 
  / /   / / ___/ __/ _ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \
 / /___/ (__  ) /_/  __/ / / /  / / / / / / /_/ /    / /_(__  ) / / /
/_____/_/____/\__/\___/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/ 
                                         /____/                      

                       Copyright 2018 Sen LEI 
                       All Rights Reserved
                """
        print(info)
        time.sleep(1)


avatar()
