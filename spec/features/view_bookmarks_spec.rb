feature 'View bookmarks' do
  scenario 'a user can see a list of bookmarks' do
    Bookmark.create(url: 'http://bbc.co.uk', title: 'BBC')
    Bookmark.create(url: 'http://cnn.com', title: 'CNN')
    Bookmark.create(url: 'http://google.co.uk', title: 'Google')

    visit '/bookmarks'
    expect(page).to have_link("BBC", href: "http://bbc.co.uk")
    expect(page).to have_link("CNN", href: "http://cnn.com")
    expect(page).to have_link("Google", href: "http://google.co.uk")
  end
end
