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
end
