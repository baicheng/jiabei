#! /bin/sh
if [ x"$1" = "x" ]; then
echo "参数出错"
exit
fi
. /home/yanyan/bin/env.conf
cd  $TESTIMG

echo `pwd`
echo "<br>"
svn cleanup ./
echo "<br>"
svn sw $SVNIMG/tags/$1
echo "<br>"
  svn info

