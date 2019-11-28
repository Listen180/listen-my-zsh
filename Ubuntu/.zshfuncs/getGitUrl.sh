# 
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2019-10-08 16:17
# * Last modified : 2019-10-08 16:17
# * Filename      : getGitUrl.sh
# * Description   : 
# *********************************************************

cat .git/config | grep url | awk -F '=' '{ print $2 }'
