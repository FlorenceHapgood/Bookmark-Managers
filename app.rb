require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/add_bookmark' do
    erb :"bookmarks/add_bookmark"
  end

  post '/save_bookmarks' do
    url = params[:address]
    title = params[:title]
    string = "That is not a real URL you fool"
    flash[:error] = string unless Bookmark.create(url, title)
    redirect '/' # I'm not wanting to do get all on bookmarks class. #I'm wanting to just interact with my test database
  end

end
