qqqqq
# code
#!/bin/bash
if [ $# -ne 2 ]
then
  echo "Usage $0  <local_dir/Filename> <shopadmin/shoplogin/shopmobile/shoppc/shopshortlink>"
  echo "./ftp.sh /home/hongwu.lin/ftp/apps-shopmobile-v0.0.2.20150930_RC.war shoppc"
  exit 1
fi
FTP_HOST=101.200.xxx.xxx
FULLNAME=$1
Local_dir=`dirname $FULLNAME`
Filename=`basename $FULLNAME`
DESTDIR=$2
if [ $2 != "shopadmin" ] && [ $2 != "shoplogin" ] && [ $2 != "shopmobile" ] && [ $2 != "shoppc" ] && [ $2 != "shopshortlink" ] 
then
   echo "Please choose <shopadmin/shoplogin/shopmobile/shoppc/shopshortlink>"
   exit 2
fi
echo "Please wait"
ftp -i -n <<!
open $FTP_HOST
user ying.xxx  xxxxxx
binary
passive
lcd $Local_dir
cd $DESTDIR
put $Filename
close
bye
!

echo "LOCAL_PATH:"$Local_dir "FILENAME:"$Filename "REMOTE_PATH:"$DESTDIR
echo "SUCCESS"
