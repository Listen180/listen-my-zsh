#!/bin/bash
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2022-11-23 09:57
# * Last modified : 2022-11-23 09:57
# * Filename      : youtube_dl.sh
# * Description   : 
# *********************************************************

URL=$1
RET=1
until [ ${RET} -eq 0 ]; do
    youtube-dl -f 137+140 --merge-output-format mp4 ${URL}
    RET=$?
    holdT=10
    echo "Retrying in ${holdT} seconds ... "
    sleep ${holdT}
done
