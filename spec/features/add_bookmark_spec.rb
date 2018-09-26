feature 'Add bookmark page' do
  scenario "Gives user ability to add a bookmark" do
    visit ('/')
    click_button("add")
    fill_in :address, with: "www.google.com"
    click_button("add")
    expect(page).to have_content "www.google.com"
  end
end
