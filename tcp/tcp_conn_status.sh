#!/bin/bash
#this script is used to get tcp and udp connetion status
#tcp status
metric=$1
 
case $metric in
   closed)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/UNCONN/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   listen)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/LISTEN/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   synrecv)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/SYN-RECV/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   synsent)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/SYN-SENT/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   established)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/ESTAB/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   timewait)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/TIME-WAIT/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   closing)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/CLOSING/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   closewait)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/CLOSE-WAIT/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   lastack)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/LAST-ACK/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
   finwait1)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/FIN-WAIT-1/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
   finwait2)
          output=$(/usr/sbin/ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/FIN-WAIT-2/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
         *)
          echo -e "\e[033mUsage: sh  $0 [closed|closing|closewait|synrecv|synsent|finwait1|finwait2|listen|established|lastack|timewait]\e[0m"
   
esac
