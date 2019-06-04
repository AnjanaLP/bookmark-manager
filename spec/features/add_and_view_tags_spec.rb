feature 'Add and view tags' do
  scenario 'a user can add a tag to a bookmark and view it' do
    bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test bookmark")

    visit '/bookmarks'
    first('.bookmark').click_button "Add tag"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

    fill_in "Tag", with: "Testing"
    click_button "Submit"
    expect(current_path).to eq '/bookmarks'
    expect(first('.bookmark')).to have_content "Testing"
  end
end
