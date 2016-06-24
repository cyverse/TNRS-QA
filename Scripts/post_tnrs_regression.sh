#!/bin/bash


if [ "$1" == "" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo .
    echo "Example usage is:"
    echo "    `basename $0` "
    echo "    first parameter should be fqdn of host to post to"
    echo "    i.e. :  host.fqdn.com"
    echo .
    exit
fi


DateDir=$(date -jn +%F | sed s/-//g)


cd $HOME/trunk/robotframework/TNRS


sftp -oPort=1657 -b - $1 <<END
-mkdir incoming/$DateDir
-cd incoming/$DateDir
-put $HOME/junk/RegressionTests_TNRS/*.html
-put $HOME/junk/RegressionTests_TNRS/*.xml
-put $HOME/junk/RegressionTests_TNRS/*.png
END


echo "Files should now be uploaded to $1"
