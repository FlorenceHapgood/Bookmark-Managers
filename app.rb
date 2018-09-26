require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end
end
