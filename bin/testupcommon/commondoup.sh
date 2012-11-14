#! /bin/sh
if [ x"$2" = "x" ]; then
echo "参数出错"
exit
fi
. /home/yanyan/bin/env.conf


case "$1" in
        img)
	rootpath=$TESTIMG
        svnpath=$SVNIMG
        ;;
        show)
	rootpath=$TESTJIABEI
        svnpath=$SVNXIU
        ;;
	server)
	rootpath=$TESTSERVICE
        svnpath=$SVNSERVICE
	;;
        *)
        echo "参数错误"
        exit
        ;;
esac

cd  $rootpath

echo `pwd`
echo "<br>"
svn cleanup ./
echo "<br>"
svn sw $svnpath/tags/$2
echo "<br>"
  svn info

