#!/bin/bash
#this script is used to get tcp and udp connetion status
#tcp status
metric=$1
export PATH=$PATH:/bin:/usr/sbin
case $metric in
   closed)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/UNCONN/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   listen)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/LISTEN/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   synrecv)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/SYN-RECV/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   synsent)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/SYN-SENT/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   established)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/ESTAB/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   timewait)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/TIME-WAIT/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   closing)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/CLOSING/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   closewait)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/CLOSE-WAIT/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   lastack)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/LAST-ACK/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
   finwait1)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/FIN-WAIT-1/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
   finwait2)
          output=$(ss  -tan|awk 'NR>1{++S[$1]}END{for (a in S) print a,S[a]}'|awk '/FIN-WAIT-2/{print $2}')
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
         *)
          echo -e "\e[033mUsage: sh  $0 [closed|closing|closewait|synrecv|synsent|finwait1|finwait2|listen|established|lastack|timewait]\e[0m"
   
esac
