# 
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2019-07-17 18:50
# * Last modified : 2019-07-17 18:50
# * Filename      : find_N_remove_log.sh
# * Description   : 
# *********************************************************

# Clean some log like files of LaTex Compiling
rm_list=(log aux dvi out synctex.gz)
empty="True"
for f in "${rm_list[@]}"; do
    res=$(find . -name \*.${f} -type f)
    if [[ ${res} == "" ]];then
	echo "[${f}] Not Found. "
    else
	echo "${res}"
	empty="False"
    fi
done

echo ''

if [[ $empty == "False" ]];then
    read -p 'Do you want to remove all files found above? [y/N]: ' ans
    case $ans in
        [Yy]* ) echo 'Deleting founded files ... ';
    	for f in "${rm_list[@]}"; do
    	    find . -name \*.${f} -type f -delete
    	done;
    	echo '... removed! ';
    	break;;
        [Nn]* ) echo 'Aborted. '; break;;
        * ) echo "Please answer yes or no.";;
    esac
else
    echo "All clear! "
fi
