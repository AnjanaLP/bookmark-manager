feature 'Update bookmarks' do
  scenario 'a user can update a bookmark' do
    bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test bookmark")
    visit '/bookmarks'
    expect(page).to have_link('Test bookmark', href: 'http://testbookmark.com')

    first('.bookmark').click_button "Edit"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in "URL", with: "http://updatedbookmark.com"
    fill_in "Title", with: "Updated bookmark"
    click_button "Submit"
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link("Test bookmark", href: "http://testbookmark.com")
    expect(page).to have_link("Updated bookmark", href: "http://updatedbookmark.com")
  end
end
