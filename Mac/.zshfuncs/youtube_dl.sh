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


RLIM=5


RNUM=0
RET=1
until [ ${RET} -eq 0 ]; do
    echo "[+] Getting info ..."
    youtube-dl -F ${URL}
    RET=$?
    if [ ${RET} -ne 0 ] && [ ${RNUM} -le ${RLIM} ]; then
        holdT=3
	((RNUM++))
	echo "  [-] Retrying in ${holdT} seconds ... (${RNUM}) "
        sleep ${holdT}
    fi
done

echo ""
echo "------------------------"
echo "Download options: "
echo "    A: normal good (22)"
echo "    B: 1080p (137+140)"
echo "------------------------"
echo ""


read -p "Which version do you want to download? : " V
    case "V" in
    a|A )
        RET=1
        until [ ${RET} -eq 0 ]; do
            echo "[+] Downloading ... "
            youtube-dl -f 22 ${URL}
            RET=$?
	    if [ ${RET} -ne 0 ]; then
                holdT=10
                echo "  [-] Retrying in ${holdT} seconds ... "
                sleep ${holdT}
	    fi
        done
        ;;
    b|B )
        RET=1
        until [ ${RET} -eq 0 ]; do
            echo "[+] Downloading ... "
            youtube-dl -f 137+140 --merge-output-format mp4 ${URL}
            RET=$?
	    if [ ${RET} -ne 0 ]; then
		holdT=10
                echo "  [-] Retrying in ${holdT} seconds ... "
                sleep ${holdT}
	    fi
        done
        ;;
    * )
        echo "Please input valid download option! "
	exit 2
        ;;
    esac


# RET=1
# until [ ${RET} -eq 0 ]; do
#     echo "[+] Downloading ... "
#     youtube-dl -f 137+140 --merge-output-format mp4 ${URL}
#     RET=$?
#     holdT=10
#     echo "  [-] Retrying in ${holdT} seconds ... "
#     sleep ${holdT}
# done
