feature 'Add bookmark page' do
  scenario "Gives user ability to add a bookmark" do
    visit('/')
    click_button("add")
    fill_in :address, with: "https://www.google.com/"
    fill_in :title, with: "Google"
    click_button("add")
    expect(page).to have_content "Google"
  end

  scenario "warns user if bookmark not real URL" do
    visit '/'
    click_button 'add'
    fill_in :address, with: "gobbledy-gook"
    fill_in :title, with: 'gobbledy-gook'
    click_button 'add'
    expect(page).not_to have_content "gobbledy-gook"
    expect(page).to have_content "That is not a real URL you fool"
  end
end
