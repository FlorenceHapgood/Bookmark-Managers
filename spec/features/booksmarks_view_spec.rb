require "pg"

  feature "view bookmarks" do
    scenario "A user can see the bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks VALUES (1, 'http://www.makersacademy.com');")
      visit "/bookmarks"
      expect(page).to have_content('http://www.makersacademy.com')
    #  expect(page).to have_content("http://www.destroyallsoftware.com")
    #  expect(page).to have_content("http://www.google.com")
    end
  end
