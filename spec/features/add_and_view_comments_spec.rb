feature 'Add and view comments' do
  scenario 'a user can add a comment to a bookmark and view it' do
    bookmark = Bookmark.create(url: "http://testbookmark.com", title: "Test bookmark")

    visit '/bookmarks'
    first('.bookmark').click_button "Add comment"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

    fill_in "Comment", with: "Test comment"
    click_button "Submit"
    expect(current_path).to eq '/bookmarks'
    expect(first('.bookmark')).to have_content "Test comment"
  end
end
