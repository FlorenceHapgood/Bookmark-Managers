require "pg"
require "./app"

  feature "view bookmarks" do
    scenario "A user can see the bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks VALUES (1, 'http://www.makersacademy.com');")
      visit "/"
      expect(page).to have_content('http://www.makersacademy.com')
    end
  end

  #for each test we have to set up the enviroment, just like setting up a new instance of a
  #class for rspec tests.
