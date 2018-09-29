feature "a user can add and then view a comment" do
  scenario "a comment is added to a bookmark" do
    bookmark = Bookmark.create("http://www.makersacademy.com", "Makers")
    visit "/"
    first('.bookmark').click_button "Add Comment"
    fill_in "comment", with: "This is a second comment" #why second?
    click_button "Submit"

    #expect(page).to eq "/bookmarks"
    # expect(page).to have_content "/bookmarks"

    expect(page).to have_content "This is a second comment"
  end
end
