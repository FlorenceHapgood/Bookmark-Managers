require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/add_bookmark' do
    erb :"bookmarks/add_bookmark"
  end

  post '/save_bookmarks' do
    url = params[:address]
    if url =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url)
    else
      flash[:error] = "That is not a real URL you fool"
    end
    redirect '/' # I'm not wanting to do get all on bookmarks class. #I'm wanting to just interact with my test database
  end


end

#

#   p "please enter again"? will that be carried to the bookmarks?
#
#
#
# else url = params[:address]
