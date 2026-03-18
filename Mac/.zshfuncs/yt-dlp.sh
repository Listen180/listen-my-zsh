#!/bin/bash
# *********************************************************
# * Author        : LEI Sen
# * Email         : sen.lei@outlook.com
# * Create time   : 2022-11-23 09:57
# * Last modified : 2026-03-18 14:59
# * Filename      : yt-dlp.sh
# * Description   : 
# *********************************************************

URL=$1


RLIM=5
RNUM=0
RET=1
until [ ${RET} -eq 0 ]; do
    if [ ${RNUM} -ge ${RLIM} ]; then
        echo "[ERROR] Reach retry limt and abort! "
        exit 5
    fi
    echo "[+] Getting info ..."
    yt-dlp -F ${URL}
    RET=$?
    if [ ${RET} -ne 0 ]; then
        holdT=3
        ((RNUM++))
        echo "  [-] Retrying in ${holdT} seconds ... (${RNUM}/${RLIM}) "
        sleep ${holdT}
    fi
done

echo ""
echo "------------------------"
echo "Download options: "
echo "    A: best (best <= 1080)"
echo "    AB: best (best of all)"
echo "    B: single (customized)"
echo "    C: combo (customized)"
echo "------------------------"
echo ""


RLIM=10
read -p "Which version do you want to download? : " V
echo "  chosen option: [${V}]"
    case "${V}" in
    "a"|"A" )
        RNUM=0
        RET=1
        until [ ${RET} -eq 0 ]; do
            if [ ${RNUM} -ge ${RLIM} ]; then
                echo "[ERROR] Reach retry limt and abort! "
                exit 5
            fi
            echo "[+] Downloading ... "
            yt-dlp --write-subs --write-auto-subs --sub-langs "en" ${URL}
            yt-dlp -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/bestvideo[height<=1080]+bestaudio/best[height<=1080]" --merge-output-format mp4 ${URL}
            RET=$?
            if [ ${RET} -ne 0 ]; then
                holdT=10
                ((RNUM++))
                echo "  [-] Retrying in ${holdT} seconds ... (${RNUM}/${RLIM}) "
                sleep ${holdT}
            fi
        done
        ;;
    "ab"|"AB" )
        RNUM=0
        RET=1
        until [ ${RET} -eq 0 ]; do
            if [ ${RNUM} -ge ${RLIM} ]; then
                echo "[ERROR] Reach retry limt and abort! "
                exit 5
            fi
            echo "[+] Downloading ... "
            yt-dlp --write-subs --write-auto-subs --sub-langs "en" ${URL}
            yt-dlp -f "bestvideo+bestaudio/best" --merge-output-format mp4 ${URL}            
            RET=$?
            if [ ${RET} -ne 0 ]; then
                holdT=10
                ((RNUM++))
                echo "  [-] Retrying in ${holdT} seconds ... (${RNUM}/${RLIM}) "
                sleep ${holdT}
            fi
        done
        ;;
    "b"|"B" )
        RNUM=0
        read -p "Select file code: " fCode
        RET=1
        until [ ${RET} -eq 0 ]; do
            if [ ${RNUM} -ge ${RLIM} ]; then
            echo "[ERROR] Reach retry limt and abort! "
            exit 5
            fi
            echo "[+] Downloading ... "
            yt-dlp --write-subs --write-auto-subs --sub-langs "en" ${URL}
            yt-dlp -f ${fCode} ${URL}
            RET=$?
            if [ ${RET} -ne 0 ]; then
                holdT=10
                ((RNUM++))
                echo "  [-] Retrying in ${holdT} seconds ... (${RNUM}/${RLIM}) "
                sleep ${holdT}
            fi
        done
        ;;
    "c"|"C" )
        RNUM=0
        read -p "Select video file code: " videoCode
        read -p "Select audio file code: " audioCode
        RET=1
        until [ ${RET} -eq 0 ]; do
            if [ ${RNUM} -ge ${RLIM} ]; then
            echo "[ERROR] Reach retry limt and abort! "
            exit 5
            fi
            echo "[+] Downloading ... "
            yt-dlp --write-subs --write-auto-subs --sub-langs "en" ${URL}
            yt-dlp -f ${videoCode}+${audioCode} --merge-output-format mp4 ${URL}
            RET=$?
            if [ ${RET} -ne 0 ]; then
                holdT=10
                ((RNUM++))
                echo "  [-] Retrying in ${holdT} seconds ... (${RNUM}/${RLIM}) "
                sleep ${holdT}
            fi
        done
        ;;
    * )
        echo "Please input valid download option! "
        #exit 4
        ;;
    esac

