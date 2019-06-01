feature 'Add bookmarks' do
  scenario 'a user can add a bookmark' do
    visit '/bookmarks'
    click_button "Add bookmark"
    expect(current_path).to eq '/bookmarks/new'

    fill_in "URL", with: "http://newbookmark.com"
    fill_in "Title", with: "New Bookmark"
    click_button "Submit"
    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link("New Bookmark", href: "http://newbookmark.com")
  end
end
