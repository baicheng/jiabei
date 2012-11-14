#! /bin/sh
if [ x"$2" = "x" ] || [ x"$3" = "x" ] || [ x"$4" = "x" ]; then
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

svn cp $svnpath/tags/$2  $svnpath/release/$3 -m "$4"

svn log $svnpath -r Head -v
