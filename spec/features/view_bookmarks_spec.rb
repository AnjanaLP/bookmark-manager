feature 'View bookmarks' do
  scenario 'a user can see a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://bbc.co.uk');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://cnn.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://google.co.uk');")

    visit '/bookmarks'
    expect(page).to have_content "http://bbc.co.uk"
    expect(page).to have_content "http://cnn.com"
    expect(page).to have_content "http://google.co.uk"
  end
end
