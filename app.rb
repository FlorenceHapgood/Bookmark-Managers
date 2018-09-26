require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/add_bookmark' do
    erb :"bookmarks/add_bookmark"
  end

  post '/save_bookmarks' do
    @address_to_be_added = params[:address]
    connection = PG.connect(dbname: 'bookmark_manager_test') #we have to do this here because we are not calling on our bookmark class at all, so we don't know about the fake test yet.
    connection.exec("INSERT INTO bookmarks(url) VALUES('#{@address_to_be_added}')")
    redirect '/' # I'm not wanting to do get all on bookmakrs class. #I'm wanting to just interact with my test database
  end


end
