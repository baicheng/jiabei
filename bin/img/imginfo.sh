#! /bin/sh

. /home/yanyan/bin/env.conf
cd  $TESTIMG
echo `pwd`
echo "<br>"
svn info $TESTIMG |sed -n '/URL/ p'
