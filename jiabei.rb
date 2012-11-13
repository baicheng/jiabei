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
              erb :doimg
        else

      end
end