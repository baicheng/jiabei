#encoding:GB18030
# Author: baicheng Date: 12-9-20 Time: 下午4:41
require 'sinatra'
@@menu_top={1=>"Testup",2=>"Create Release",3=>"Del Release"}
@@menu_testup={1=>"Img",2=>"Show",3=>"Server"}
@@menu_testup_3={1=>"Img2",2=>"Show3",3=>"Server4"}
#@@display_menu=@@menu_top
get '/' do
  @key=params[:key]
=begin
  @key_top = params[:key]
  @key_testup = params[:key2]
=end
      case @key
        when "1"
          @@display_menu=@@menu_testup
          @postid="/testup"
	when "2"
	@@display_menu=@@menu_testup
          @postid="/createrelease"
	when "3"
        @@display_menu=@@menu_testup
          @postid="/delrelease"
        else
          @@display_menu=@@menu_top
          @postid="/"
      end

 erb :index
end

get '/testup' do
  @key=params[:key]
  case @key
    when "1"
	@keyname="img"
    when "2"
	@keyname="show"
    when "3"
	@keyname="server"
    else
      end
@cmdresult1,@cmdresult2=processtestinfocmd(@keyname)
erb:doimg
end

get '/testupresult' do

    @tag=params[:tags]
    @hidden=params[:hidden]
 if @tag
#	@cmdresult=`/home/yanyan/baicheng/jiabei-master/bin/img/imgdoup.sh #{@tag}`
 @cmdresult=processdotestupcmd(@hidden,@tag)
	@cmdresult=@cmdresult.gsub("\n","<br>")
	erb :doimgup
end
	
end

get '/createrelease' do

	@key=params[:key]
  case @key
    when "1"
        @keyname="img"
    when "2"
        @keyname="show"
    when "3"
        @keyname="server"
    else
      end
@cmdresult1,@cmdresult2,@cmdresult3,@cmdresult4=processcreateinfocmd(@keyname)
erb:docreate
end


get '/createresult' do
    tag=params[:tags]
    hidden=params[:hidden]
    releasenum=params[:releasenum]
    svnlog=params[:svnlog]
    alltags=params[:hidden2]
   if !alltags.include?(releasenum+"/")
   @cmdresult=processdocreatecmd(hidden,tag,releasenum,svnlog)
   @cmdresult=@cmdresult.gsub("\n","<br>")	
   else
    @cmdresult="Error ! "+releasenum+" Release is already exist"
   end

erb :doimgup

end

get '/delrelease' do
	
  @key=params[:key]
  case @key
    when "1"
        @keyname="img"
    when "2"
        @keyname="show"
    when "3"
        @keyname="server"
    else
   end
@cmdresult1,@cmdresult2=processdelinfocmd(@keyname)
erb:dodel
end

get '/delresult' do

tag=params[:tags]
hidden=params[:hidden]
svnlog=params[:svnlog]
@cmdresult=processdodelcmd(hidden,tag,svnlog)
@cmdresult=@cmdresult.gsub("\n","<br>")
erb :doimgup

end

def processtestinfocmd(key)
cmdresult1=`bin/testupcommon/commoninfo.sh #{key}  2>&1 `
cmdresult2=`bin/testupcommon/commontaginfo.sh #{key} `
cmdresult2=cmdresult2.split("\n")
return cmdresult1,cmdresult2	
end

def processdotestupcmd(key,tag)
cmdresult=`bin/testupcommon/commondoup.sh #{key} #{@tag} 2>&1`
return cmdresult
end

def processcreateinfocmd(key)
cmdresult1=`bin/createcommon/commonsvninfo.sh #{key}  2>&1`.strip
cmdresult2=`bin/createcommon/commontaginfo.sh #{key}  2>&1`.strip
cmdresult2=cmdresult2.split("\n")
cmdresult3=`bin/createcommon/commonreleaseinfo.sh #{key}  2>&1`
cmdresult4=cmdresult3.dup
cmdresult3=cmdresult3.split("\n")
releasenum=Time.now.strftime("%Y%m%d")
i=1
while true do
tmp="%02d" % i
tmp_num=releasenum.to_s + tmp.to_s
puts tmp_num
if !cmdresult3.include?(tmp_num.to_s+"/")
	cmdresult3=tmp_num.strip
	puts cmdresult3
break
end
i+=1
end
return cmdresult1,cmdresult2,cmdresult3,cmdresult4
end

def processdocreatecmd(key,tag,release,svnlog)
cmdresult=`bin/createcommon/commondocreate.sh #{key} #{tag} #{release} "#{svnlog}"  2>&1`
#puts key,tag,release,svnlog
return cmdresult
end

def processdelinfocmd(key)
cmdresult1=`bin/delcommon/commonsvninfo.sh #{key}  2>&1`.strip
cmdresult2=`bin/delcommon/commonreleaseinfo.sh #{key}  2>&1`.strip
cmdresult2=cmdresult2.split("\n")
return cmdresult1,cmdresult2
end

def processdodelcmd(key,tag,svnlog)
cmdresult=`bin/delcommon/commondodel.sh #{key} #{tag} "#{svnlog}"  2>&1`
end
