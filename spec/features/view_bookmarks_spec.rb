feature 'View bookmarks' do
  scenario 'a user can see a list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "http://bbc.co.uk"
    expect(page).to have_content "http://cnn.com"
    expect(page).to have_content "http://google.co.uk"
  end
end
