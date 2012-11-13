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
@cmdresult2=Array.new
	@cmdresult1=`/home/yanyan/baicheng/jiabei-master/bin/img/imginfo.sh`
	@cmdresult2=`/home/yanyan/baicheng/jiabei-master/bin/img/imgtaginfo.sh`
	@cmdresult2=@cmdresult2.split("\n")
	p @cmdresult2
	p @cmdresult2.size
              erb :doimg
        else
	
      end
end

get '/testupresult' do

    @tag=params[:tags]
 if @tag
	@cmdresult=`/home/yanyan/baicheng/jiabei-master/bin/img/imgdoup.sh #{@tag}`
	@cmdresult=@cmdresult.gsub("\n","<br>")
	p @cmdresult
	erb :doimgup
end
	
end


