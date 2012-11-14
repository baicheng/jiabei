#! /bin/sh

. /home/yanyan/bin/env.conf

case "$1" in
	img)
	rootpath=$TESTIMG
	;;
	show)
	rootpath=$TESTJIABEI
	;;
	server)
	rootpath=$TESTSERVICE
	;;
	*)
	echo "参数错误"
	exit
	;;
esac

cd  $rootpath
echo `pwd`
echo "<br>"
svn info $rootpath |sed -n '/URL/ p'
