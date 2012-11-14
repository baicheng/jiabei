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
	p @cmdresult
	erb :doimgup
end
	
end

def processtestinfocmd(key)
cmdresult1=`bin/testupcommon/commoninfo.sh #{key}  2>&1 `
cmdresult2=`bin/testupcommon/commontaginfo.sh #{key} `
cmdresult2=cmdresult2.split("\n")
return cmdresult1,cmdresult2	
end

def processdotestupcmd(key,tag)
cmdresult=`bin/testupcommon/commondoup.sh #{key} #{@tag} 2>&1`
end

