feature "Updating a bookmark" do
  scenario "A user can update a bookmark" do
    Bookmark.create("http://www.makersacademy.com", "Makers Academy")
    visit '/'
    first('.bookmark').click_button 'Update'
    fill_in :address, with: "https://www.google.com"
    fill_in :title, with: "Google"
    click_button("Update")
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_content("Google")
  end

  scenario "A user tries to update with url that isn't real" do
    Bookmark.create("http://www.makersacademy.com", "Makers Academy")
    visit "/"
    first('.bookmark').click_button 'Update'
    fill_in :address, with: "Blah"
    fill_in :title, with: "Blah"
    click_button("Update")
    expect(current_path). to eq '/bookmarks'
    expect(page).not_to have_content("Blah")
    expect(page).to have_content("That is not a real URL you FOOL")
  end

end
