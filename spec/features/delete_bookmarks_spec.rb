feature 'Delete bookmarks' do
  scenario 'a user can delete a bookmark' do
    Bookmark.create(url: "http://testbookmark.com", title: "Test bookmark")
    visit '/bookmarks'
    expect(page).to have_link("Test bookmark", href: "http://testbookmark.com")

    first(".bookmark").click_button "Delete"
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Test bookmark", href: "http://testbookmark.com")
  end
end
