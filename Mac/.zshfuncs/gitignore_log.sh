# 
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2019-07-17 19:48
# * Last modified : 2019-10-29 17:02
# * Filename      : gitignore_log.sh
# * Description   : 
# *********************************************************

# Clean some log like files of LaTex Compiling
ignore_list=(log aux dvi out synctex.gz nav snm toc pdf)
for f in "${ignore_list[@]}"; do
    reg="/*.${f}"
    if [[ -f ./.gitignore ]]; then
    check=$(cat ./.gitignore | grep "/\*.${f}")
    if [[ "${check}" == *"${reg}"* ]];then
        echo "Already ignored: ${check}"
    else
        echo "${reg}" >> ./.gitignore
    fi
    else
    echo "${reg}" > ./.gitignore
    fi
done
