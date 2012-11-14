#! /bin/sh
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

svn list $svnpath/tags|sort -r
