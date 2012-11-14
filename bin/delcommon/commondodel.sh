#! /bin/sh
if [ x"$2" = "x" ] || [ x"$3" = "x" ] ; then
echo "参数出错"
exit
fi
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

svn delete $svnpath/release/$2 -m "$3"

svn log $svnpath -r Head -v
