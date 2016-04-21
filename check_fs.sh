#!/bin/bash
 #service monitoring squid3 finalspeed  
 
 /bin/netstat -tulpn | awk '{print $4}' | awk -F: '{print $4}' | grep ^150$ > /dev/null   2>/dev/null
 b=$(echo $?)
 if test $b -ne 0
 then
 #echo "named service down" | mail -s "DNS Service DOWN and restarted now" root@localhost
 sh /fs/restart.sh > /dev/null 2>/dev/null
 else
 sleep 0
 fi
 
  /bin/netstat -tulpn | awk '{print $4}' | awk -F: '{print $4}' | grep ^1723$ > /dev/null   2>/dev/null
 b=$(echo $?)
 if test $b -ne 0
 then
 #echo "named service down" | mail -s "DNS Service DOWN and restarted now" root@localhost
/etc/init.d/pptpd restart > /dev/null 2>/dev/null
 else
 sleep 0
 fi