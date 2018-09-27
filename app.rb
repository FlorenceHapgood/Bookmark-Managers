require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'


class BookmarkManager < Sinatra::Base
  enable :sessions
  enable :method_override

  register Sinatra::Flash

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/add_bookmark"
  end

  post '/bookmarks' do
    url = params[:address]
    title = params[:title]
    string = "That is not a real URL you fool"
    flash[:error] = string unless Bookmark.create(url, title)
    redirect '/' # I'm not wanting to do get all on bookmarks class. #I'm wanting to just interact with my test database
  end

  delete "/bookmarks/:id" do
     Bookmark.delete(params[:id])
     redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @id = params[:id]
    erb :"bookmarks/edit_bookmark"
  end

  patch '/bookmarks/:id' do
    Bookmark.update(params[:id], params[:address], params[:title])
    redirect '/bookmarks'
  end

end
