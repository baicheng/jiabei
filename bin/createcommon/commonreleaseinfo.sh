#! /bin/sh
. bin/env.conf

case "$1" in
        img)
	svnpath=$SVNIMG
        ;;
        show)
	svnpath=$SVNXIU
        ;;
	server)
	svnpath=$SVNSERVICE
	;;
        *)
        echo "参数错误"
        exit
        ;;
esac

svn list $svnpath/release|sort -r
