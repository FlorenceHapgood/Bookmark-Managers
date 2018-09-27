feature "Deleting a bookmark" do
  scenario "A user can delete a bookmark" do
    Bookmark.create("http://www.makersacademy.com", "Makers Academy")
    visit '/'
    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Makers Academy", href: "http://www.makersacademy.com")
  end
end
