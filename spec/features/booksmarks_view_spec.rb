require "pg"
require "./app"

  feature "view bookmarks" do
    scenario "A user can see the bookmarks" do
      Bookmark.create("http://www.makersacademy.com", 'Makers')
      visit "/"
      expect(page).to have_content('Makers')
    end
  end

  #for each test we have to set up the enviroment, just like setting up a new instance of a
  #class for rspec tests.

  # we have to add in bookmarks because out bookmark.rb doesn't start with anything in it,
  #it's empty.
